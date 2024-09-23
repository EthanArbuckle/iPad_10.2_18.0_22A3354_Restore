@implementation _NSFaultingMutableOrderedSet

- (uint64_t)_orderKeyForObject:(uint64_t)a1
{
  unint64_t v4;
  unint64_t v5;

  while (1)
  {
    if (!a1)
      return 0;
    v4 = objc_msgSend(*(id *)(a1 + 16), "indexOfObject:", a2);
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
      break;
    a1 = *(_QWORD *)(a1 + 40);
    if (!a1)
      return 0;
  }
  if (!*(_QWORD *)(a1 + 32))
    return 0;
  v5 = v4;
  if (v4 >= objc_msgSend(*(id *)(a1 + 16), "count"))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Index of object > number of objects"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a1, CFSTR("_NSFaultingMutableOrderedSet"))), "raise");
  return *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4 * v5);
}

- (void)willReadWithContents:(id)a3
{
  _QWORD *realSet;
  NSManagedObjectContext *v6;
  NSEntityDescription *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  NSManagedObject *source;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t i;
  uint64_t v23;
  void *v24;
  void *v25;
  unint64_t flags;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    realSet = self->_realSet;
    v6 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    v7 = -[NSManagedObject entity](self->_source, "entity");
    if (a3)
    {
      v8 = objc_msgSend(a3, "count");
      v9 = MEMORY[0x1E0C80A78](v8);
      v12 = (char *)&v27 - v11;
      if (v9 > 0x200)
        v12 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)&v27 - v11, 8 * v10);
      objc_msgSend(a3, "getObjects:range:", v12, 0, v8);
      self->_realSet = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v12, v8);
      if (v8 >= 0x201)
        NSZoneFree(0, v12);
      if (!realSet)
        goto LABEL_30;
    }
    else
    {
      v13 = *(Class *)((char *)&v7->_properties[3].super.super.isa
                     + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
      source = self->_source;
      if (source)
        v15 = _insertion_fault_handler;
      else
        v15 = 0;
      v16 = -[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v15, source, v13, (uint64_t)v6);
      v17 = objc_msgSend(v16, "count");
      if (v17)
      {
        v18 = v17;
        v27 = (uint64_t)&v27;
        v19 = MEMORY[0x1E0C80A78](v17);
        v21 = (char *)&v27 - v20;
        if (v19 > 0x200)
          v21 = (char *)NSAllocateScannedUncollectable();
        else
          bzero((char *)&v27 - v20, 8 * v19);
        objc_msgSend(v16, "getObjects:", v21, v27, v28);
        for (i = 0; i != v18; ++i)
          *(_QWORD *)&v21[8 * i] = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v6, *(void **)&v21[8 * i], 0);
        v23 = 0;
        self->_realSet = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v21, v18);
        do

        while (v18 != v23);
        if (v18 >= 0x201)
          NSZoneFree(0, v21);
      }
      else
      {
        self->_realSet = objc_alloc_init(MEMORY[0x1E0C99E10]);
      }

      if (!realSet)
        goto LABEL_30;
    }
    v25 = (void *)*realSet;
    v24 = (void *)realSet[1];
    if (*realSet)
    {
      objc_msgSend(self->_realSet, "unionSet:", *realSet);

    }
    if (v24)
    {
      objc_msgSend(self->_realSet, "minusSet:", v24);

    }
    PF_FREE_OBJECT_ARRAY(realSet);
LABEL_30:
    flags = self->_flags;
    self->_flags = (_NSFaultingMutableOrderedSetFlags)(flags & 0xFFFFFFFE);
    -[NSManagedObject _commitPhotoshoperyForRelationshipAtIndex:newValue:]((uint64_t)self->_source, flags >> 16, self);
  }
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "getObjects:range:", a3, location, length);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (unint64_t)count
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "count");
}

- (void)willRead
{
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    -[_NSFaultingMutableOrderedSet willReadWithContents:](self, "willReadWithContents:", 0);
}

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
          -[_NSFaultingMutableOrderedSet dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (_NSFaultingMutableOrderedSet)retain
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

- (BOOL)_shouldProcessKVOChange
{
  return (*(_BYTE *)&self->_flags & 4) == 0;
}

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 destinations:(id)a4 forRelationship:(id)a5 inContext:(id)a6
{
  _NSFaultingMutableOrderedSet *v7;
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
  v7 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:](self, "initWithSource:forRelationship:asFault:", a3, a5, 0, a6);
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

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    v5 = objc_msgSend(a3, "isNSOrderedSet");
    if (v5)
      LOBYTE(v5) = -[_NSFaultingMutableOrderedSet isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
  }
  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "objectAtIndex:", a3);
}

- (id)_newOrderKeys
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  BOOL v12;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v1 = a1;
  v19[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return (id)v1;
  v2 = objc_msgSend(*(id *)(a1 + 16), "count");
  v9 = v2;
  v10 = *(_QWORD *)(v1 + 32);
  if (v10)
    v11 = v2 == 0;
  else
    v11 = 1;
  if (!v11)
  {
    if (v2 >= 0x201)
      v14 = 1;
    else
      v14 = v2;
    v15 = (8 * v14 + 15) & 0xFFFFFFFFFFFFFFF0;
    v16 = (char *)v19 - v15;
    if (v2 > 0x200)
      v16 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v19 - v15, 8 * v2);
    v17 = 0;
    do
    {
      *(_QWORD *)&v16[8 * v17] = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(v1 + 32) + 4 * v17));
      ++v17;
    }
    while (v9 != v17);
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v16, v9);
    v18 = 0;
    do

    while (v9 != v18);
    if (v9 >= 0x201)
      NSZoneFree(0, v16);
    return (id)v1;
  }
  if (v10)
    v12 = 1;
  else
    v12 = v2 == 0;
  if (!v12)
    _NSCoreDataLog(1, (uint64_t)CFSTR("nil order keys and %d objects in real set"), v3, v4, v5, v6, v7, v8, v2);
  return (id)NSArray_EmptyArray;
}

- (id)valueForKey:(id)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "valueForKey:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "indexOfObject:", a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSFaultingMutableOrderedSet *v5;
  _NSFaultingMutableOrderedSet *v6;
  id v7;
  id v8;
  id *realSet;
  _QWORD *v10;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v6 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:]([_NSFaultingMutableOrderedSet alloc], "initWithSource:forRelationship:asFault:", self->_source, -[_NSFaultingMutableOrderedSet relationship](self, "relationship"), 1);
    realSet = (id *)self->_realSet;
    if (realSet)
    {
      v10 = PF_ALLOCATE_OBJECT_ARRAY(2);
      *v10 = objc_msgSend(*realSet, "mutableCopyWithZone:", a3);
      v10[1] = objc_msgSend(realSet[1], "mutableCopyWithZone:", a3);
      v6->_realSet = v10;
    }
    v6->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&v6->_flags & 0xFFFFFFFD | (2
                                                                                          * ((*(_DWORD *)&self->_flags >> 1) & 1)));
    return v6;
  }
  if (objc_msgSend(self->_realSet, "count"))
  {
    v5 = -[_NSFaultingMutableOrderedSet initWithSource:forRelationship:asFault:]([_NSFaultingMutableOrderedSet alloc], "initWithSource:forRelationship:asFault:", self->_source, -[_NSFaultingMutableOrderedSet relationship](self, "relationship"), 0);
    v6 = v5;
    v7 = self->_realSet;
    if (v7)
    {
      v8 = v5->_realSet;
      if (v8)
      {

        v7 = self->_realSet;
      }
      v6->_realSet = v7;
      *(_DWORD *)&self->_flags |= 8u;
      *(_DWORD *)&v6->_flags |= 0x10u;
    }
    return v6;
  }
  return (id)NSOrderedSet_EmptyOrderedSet;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

- (NSPropertyDescription)relationship
{
  return *(NSPropertyDescription **)((_QWORD)-[NSManagedObject entity](self->_source, "entity")[96]
                                   + 24
                                   + (((unint64_t)self->_flags >> 13) & 0x7FFF8));
}

- (_NSFaultingMutableOrderedSet)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  _BOOL4 v5;
  _NSFaultingMutableOrderedSet *v8;
  _NSFaultingMutableOrderedSet *v9;
  unsigned int v10;
  unsigned int v11;
  id v12;
  objc_super v14;

  v5 = a5;
  v14.receiver = self;
  v14.super_class = (Class)_NSFaultingMutableOrderedSet;
  v8 = -[_NSFaultingMutableOrderedSet init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    if (objc_msgSend(a4, "_isRelationship"))
      v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD | (2 * ((unint64_t)(objc_msgSend(a4, "deleteRule") - 1) < 2));
    else
      v10 = *(_DWORD *)&v9->_flags & 0xFFFFFFFD;
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)v10;
    v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v10 & 0xFFFF001F);
    v11 = *(_DWORD *)&v9->_flags & 0xFFE3 | (objc_msgSend(a4, "_entitysReferenceID") << 16);
    if (v5)
    {
      v12 = 0;
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 | 1);
    }
    else
    {
      v9->_flags = (_NSFaultingMutableOrderedSetFlags)(v11 & 0xFFFFFFE2);
      v12 = objc_alloc_init(MEMORY[0x1E0C99E10]);
    }
    v9->_realSet = v12;
    v9->_orderKeys = 0;
  }
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead", a3);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithOrderedSet:", self->_realSet);
}

- (void)dealloc
{
  id *realSet;
  unsigned int *orderKeys;
  malloc_zone_t *v5;

  realSet = (id *)self->_realSet;
  if (realSet && (*(_BYTE *)&self->_flags & 1) != 0)
  {

    PF_FREE_OBJECT_ARRAY(self->_realSet);
  }
  else
  {

  }
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    v5 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v5 = malloc_default_zone();
      orderKeys = self->_orderKeys;
    }
    malloc_zone_free(v5, orderKeys);
    self->_orderKeys = 0;
  }

  self->_grottyHack = 0;
  self->_realSet = 0;
  self->_source = 0;

  self->_forcedKeys = 0;
  _PFDeallocateObject(self);
}

- (void)_setProcessingIdempotentKVO:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  NSManagedObject *source;
  NSPropertyDescription *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
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
          v6 = -[_NSFaultingMutableOrderedSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)objc_msgSend(a3, "relationship"))
            return 1;
        }
      }
    }
  }
  v7 = -[_NSFaultingMutableOrderedSet count](self, "count");
  if (v7 != objc_msgSend(a3, "count"))
    return 0;
  if (v7 <= 1)
    v8 = 1;
  else
    v8 = v7;
  if (v7 >= 0x201)
    v9 = 1;
  else
    v9 = v8;
  v10 = (char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 > 0x200)
    v10 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v19 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
  -[_NSFaultingMutableOrderedSet getObjects:](self, "getObjects:", v10);
  v21 = 0u;
  v22 = 0u;
  v20 = 0u;
  v19 = 0u;
  v12 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      v16 = 0;
      v17 = &v10[8 * v14];
      v14 += v13;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(a3);
        if (*(_QWORD *)&v17[8 * v16] != *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16))
        {
          v11 = 0;
          goto LABEL_31;
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v13)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_31:
  if (v7 >= 0x201)
    NSZoneFree(0, v10);
  return v11;
}

- (void)getObjects:(id *)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "getObjects:range:", a3, 0, objc_msgSend(self->_realSet, "count"));
}

- (void)_populateOrderKeysUsingSnapshot:(void *)a3 orderKeys:(_QWORD *)a4 newIndexes:(void *)a5 reorderedIndexes:
{
  size_t v9;
  size_t v10;
  _QWORD *v11;
  void *v12;
  BOOL v13;
  unsigned int *v14;
  unsigned int v15;
  BOOL v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  unsigned int *v26;
  unsigned int v27;
  void *v28;
  const __CFDictionary *v29;
  uint64_t v30;
  const void **v31;
  uint64_t v32;
  char *v33;
  const void **v34;
  const __CFDictionary *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  char isKindOfClass;
  const void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *Value;
  uint64_t v46;
  unsigned int v47;
  BOOL v48;
  char v49;
  void *v50;
  _BYTE *v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  char v57;
  char v58;
  int v59;
  BOOL v60;
  unsigned int v61;
  void **v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  unsigned int *v80;
  unsigned int v81;
  unint64_t v82;
  unsigned int *v83;
  unsigned int v84;
  uint64_t v85;
  uint64_t *v86;
  id v87;
  _BYTE *v88;
  CFDictionaryRef v89;
  void **v90;
  id v91;
  int v92;
  char *v93;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;
  uint64_t v96;

  v91 = a3;
  v96 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v9 = objc_msgSend(*(id *)(a1 + 16), "count");
  v10 = v9;
  if (a5)
  {
    v11 = *a4;
    v12 = *a5;
    if (*(_QWORD *)(a1 + 32))
      v13 = 1;
    else
      v13 = v9 == 0;
    if (v13)
    {
      memset(*a5, 1, v9);
      if (v10)
      {
        v14 = *(unsigned int **)(a1 + 32);
        do
        {
          v15 = *v14++;
          *v11++ = v15;
          --v10;
        }
        while (v10);
      }
      return;
    }
  }
  else
  {
    if (*(_QWORD *)(a1 + 32))
      v16 = 1;
    else
      v16 = v9 == 0;
    if (v16)
      return;
    v12 = 0;
    v11 = 0;
  }
  v17 = objc_msgSend(a2, "count");
  v18 = v10;
  *(_QWORD *)(a1 + 32) = PF_CALLOC_UNSCANNED_BYTES(4 * v10);
  v87 = a2;
  if (!a2 || !v91 || !v17 || (v19 = v17, v17 != objc_msgSend(v91, "count")))
  {
    if ((v10 + 1) < 0x400000)
    {
      if (!(_DWORD)v10)
        goto LABEL_29;
      v23 = 1024;
    }
    else
    {
      v23 = 0xFFFFFFFF / ((int)v10 + 1);
    }
    v24 = 0;
    v25 = 2 * v23;
    do
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v24) = v25;
      v25 += v23;
      ++v24;
    }
    while (v10 != v24);
LABEL_29:
    if (a5)
    {
      memset(v12, 1, v10);
      if ((_DWORD)v10)
      {
        v26 = *(unsigned int **)(a1 + 32);
        do
        {
          v27 = *v26++;
          *v11++ = v27;
          --v18;
        }
        while (v18);
      }
    }
    return;
  }
  v88 = v12;
  v86 = &v85;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v22 = (char *)&v85 - v20;
  v85 = v21;
  if (v10 > 0x200uLL)
    v22 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v85 - v20, 8 * v21);
  v28 = *(void **)(a1 + 16);
  v93 = v22;
  objc_msgSend(v28, "getObjects:range:", v22, 0, v10, v85, v86);
  v29 = 0;
  if (v17 >= 6)
  {
    memset(&keyCallBacks, 0, 24);
    *(_OWORD *)&keyCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
    keyCallBacks.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
    memset(&valueCallBacks, 0, 24);
    *(_OWORD *)&valueCallBacks.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B3A0] + 24);
    MEMORY[0x1E0C80A78](0);
    v31 = (const void **)((char *)&v85 - v30);
    if (v17 > 0x200uLL)
    {
      v31 = (const void **)NSAllocateScannedUncollectable();
      objc_msgSend(v87, "getObjects:range:", v31, 0, v17);
      v33 = (char *)NSAllocateScannedUncollectable();
    }
    else
    {
      bzero((char *)&v85 - v30, 8 * v17);
      v32 = objc_msgSend(v87, "getObjects:range:", v31, 0, v17);
      MEMORY[0x1E0C80A78](v32);
      v33 = (char *)&v85 - ((8 * v17 + 15) & 0xFFFFFFFF0);
      bzero(v33, 8 * v19);
    }
    objc_msgSend(v91, "getObjects:range:", v33, 0, v19);
    v29 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v31, (const void **)v33, v19, &keyCallBacks, &valueCallBacks);
    if (v19 >= 0x201)
    {
      v34 = v31;
      v35 = v29;
      NSZoneFree(0, v34);
      NSZoneFree(0, v33);
      v29 = v35;
    }
  }
  v89 = v29;
  v90 = a5;
  if ((_DWORD)v10)
  {
    v36 = 0;
    v92 = 0;
    v37 = 0;
    v38 = 1;
    v39 = v93;
    while (1)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v41 = *(const void **)&v39[8 * v36];
      if ((isKindOfClass & 1) == 0)
        v41 = (const void *)objc_msgSend(*(id *)&v39[8 * v36], "objectID");
      v42 = *(void **)(a1 + 48);
      if (!v42)
        goto LABEL_50;
      v43 = objc_msgSend(v42, "objectForKey:", v41);
      v44 = (void *)v43;
      if (v90 && v43)
      {
        v88[v36] = 1;
        goto LABEL_56;
      }
      if (!v43)
      {
LABEL_50:
        if (v89)
        {
          Value = (void *)CFDictionaryGetValue(v89, v41);
        }
        else
        {
          v46 = objc_msgSend(v87, "indexOfObject:", v41);
          if (v46 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v44 = 0;
            goto LABEL_56;
          }
          Value = (void *)objc_msgSend(v91, "objectAtIndex:", v46);
        }
        v44 = Value;
      }
LABEL_56:
      v47 = objc_msgSend(v44, "unsignedIntValue");
      if (v44 && v47)
      {
        if (v37)
          v48 = v37 < v47;
        else
          v48 = 1;
        v49 = v48;
        if ((v38 & 1) != 0)
          v37 = v47;
        v38 &= v49;
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v36) = v47;
      }
      else
      {
        v38 &= v44 == 0;
        ++v92;
        if (v37)
          ++v37;
        else
          v37 = 0;
      }
      v39 = v93;
      if (v10 == ++v36)
        goto LABEL_73;
    }
  }
  v92 = 0;
  v38 = 1;
  v39 = v93;
LABEL_73:
  if (v89)
    CFRelease(v89);
  v50 = *(void **)(a1 + 48);
  v51 = v88;
  if (v50)
  {

    *(_QWORD *)(a1 + 48) = 0;
  }
  if (v92 == (_DWORD)v10)
    v52 = 1;
  else
    v52 = v38;
  if ((v52 & 1) == 0)
  {
    v53 = 0;
    v54 = 0;
    v55 = ~v92 + v10;
    v56 = 2;
    v57 = 1;
    while (1)
    {
      v58 = v57;
      v59 = ((uint64_t (*)(_QWORD, size_t, uint64_t, uint64_t))preserveOrderKeyFuncs[v53])(*(_QWORD *)(a1 + 32), v10, v54, 1);
      if (v59 == v55)
        break;
      v57 = 0;
      v60 = v59 <= (int)v54;
      if (v59 <= (int)v54)
        v54 = v54;
      else
        v54 = v59;
      if (!v60)
        v56 = v53;
      v53 = 1;
      if ((v58 & 1) == 0)
        goto LABEL_91;
    }
    v56 = v53;
LABEL_91:
    if (v56 <= 1)
      v61 = v56;
    else
      v61 = 0;
    ((void (*)(_QWORD, size_t, uint64_t, _QWORD))preserveOrderKeyFuncs[v61])(*(_QWORD *)(a1 + 32), v10, v54, 0);
    v51 = v88;
    v39 = v93;
  }
  v62 = v90;
  if (v10 >= 0x201uLL)
    NSZoneFree(0, v39);
  if (!(_DWORD)v10)
  {
LABEL_126:
    v71 = v85;
    if (v62 && (_DWORD)v10)
      goto LABEL_157;
    return;
  }
  v63 = 0;
  v64 = 0;
  v65 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v66 = *(_QWORD *)(a1 + 32);
    v67 = *(unsigned int *)(v66 + 4 * v63);
    if (v65 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ((_DWORD)v67)
        v65 = 0x7FFFFFFFFFFFFFFFLL;
      else
        v65 = v63;
    }
    else
    {
      if (!(_DWORD)v67)
        goto LABEL_123;
      if (v65)
      {
        v64 = *(unsigned int *)(v66 + 4 * (v65 - 1));
        v68 = (uint64_t)(v67 - v64) / (v63 - (v65 - 1));
        v69 = v68 + v64;
        if (!v68)
          goto LABEL_114;
      }
      else
      {
        if (v63 >= v67 >> 10)
          v68 = v67 / ((int)v63 + 1);
        else
          v68 = 1024;
        v69 = v67 - v68 * v63;
        if (!v68)
        {
LABEL_114:
          *(_DWORD *)(v66 + 4 * v63) = 0;
          goto LABEL_123;
        }
      }
      if (v65 && v68 == 1 && v67 - v64 == v63 - v65 + 1)
        goto LABEL_114;
      if (v65 < v63)
      {
        do
        {
          if (v69 <= 1)
            v70 = 1;
          else
            v70 = v69;
          *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v65) = v70;
          if (v62)
            v51[v65] = 1;
          v69 = v70 + v68;
          ++v65;
        }
        while (v63 != v65);
      }
      v65 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_123:
    ++v63;
  }
  while (v63 != v10);
  if (v65)
  {
    if (v65 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_126;
    v72 = *(_QWORD *)(a1 + 32);
    v73 = *(unsigned int *)(v72 + 4 * v65 - 4);
    if (v65 >= 1 && v65 + (v10 ^ 0xFFFFFFFFLL) <= v73)
    {
      v74 = v72 - 4;
      while (1)
      {
        v73 = *(unsigned int *)(v74 + 4 * v65);
        if ((_DWORD)v73 && (v10 ^ 0xFFFFFFFFLL) + v65 >= v73)
          break;
        if ((unint64_t)v65-- <= 1)
          goto LABEL_138;
      }
    }
    if ((uint64_t)(v73 + ((v10 - v65) << 10)) < 0x100000000)
      v77 = 1024;
    else
      v77 = (v73 ^ 0xFFFFFFFFLL) / (v10 - v65);
    if (v10 > v65)
    {
      v82 = v77 + v73;
      if (v82 <= 1)
        LODWORD(v82) = 1;
      do
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v65) = v82;
        if (v62)
          v51[v65] = 1;
        ++v65;
        LODWORD(v82) = v82 + v77;
      }
      while (v10 != v65);
    }
    v71 = v85;
    if (v62)
    {
LABEL_157:
      v83 = *(unsigned int **)(a1 + 32);
      do
      {
        v84 = *v83++;
        *v11++ = v84;
        --v71;
      }
      while (v71);
    }
  }
  else
  {
LABEL_138:
    if ((v10 + 1) < 0x400000)
      v76 = 1024;
    else
      v76 = 0xFFFFFFFF / ((int)v10 + 1);
    v78 = 0;
    v79 = 2 * v76;
    do
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 4 * v78) = v79;
      v79 += v76;
      ++v78;
    }
    while (v10 != v78);
    if (v62)
    {
      memset(v51, 1, v10);
      v80 = *(unsigned int **)(a1 + 32);
      do
      {
        v81 = *v80++;
        *v11++ = v81;
        --v18;
      }
      while (v18);
    }
  }
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unsigned int *orderKeys;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  void *v18;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  _QWORD v21[2];

  length = a3.length;
  location = a3.location;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (length > 2)
  {
    v8 = objc_msgSend(self->_realSet, "count");
    if (location < v8)
    {
      v9 = v8;
      v10 = v8 + 1;
      v11 = 1;
      if (v8 + 1 > 1)
        v11 = v8 + 1;
      if (v10 >= 0x201)
        v12 = 1;
      else
        v12 = v11;
      v13 = (char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v10 > 0x200)
        v13 = (char *)NSAllocateScannedUncollectable();
      else
        bzero((char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
      objc_msgSend(self->_realSet, "getObjects:", v13);
      v14 = location + length;
      if (location + length >= v9)
        v15 = v9;
      else
        v15 = location + length;
      if (v9 > v14)
      {
        v16 = v15;
        v17 = location;
        do
        {
          *(_QWORD *)&v13[8 * v17++] = *(_QWORD *)&v13[8 * v16];
          if (v17 >= v9)
            break;
          ++v16;
        }
        while (v16 < v9);
      }
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObjects:count:", v13, v9 + location - v15);
      if (v10 >= 0x201)
        NSZoneFree(0, v13);
      realSet = self->_realSet;
      flags = self->_flags;
      if ((*(_BYTE *)&flags & 8) != 0)
        self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      self->_realSet = v18;

    }
  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v7 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "removeObjectsInRange:", location, length);
  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  unint64_t v9;
  unsigned int *orderKeys;
  void *v11;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  const __CFAllocator *v14;
  CFArrayRef v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[_NSFaultingMutableOrderedSet willChange](self);
  v9 = objc_msgSend(self->_realSet, "count");
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (v9 <= a5)
  {
    -[_NSFaultingMutableOrderedSet addObjects:count:](self, "addObjects:count:", a3, a4);
  }
  else if (a4 > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = _PFStackAllocatorCreate((unint64_t *)&v16, 1024);
    v15 = CFArrayCreate(v14, a3, a4, 0);
    self->_realSet = (id)+[_PFRoutines newOrderedSetFromCollection:byInsertingItems:atIndex:]((uint64_t)_PFRoutines, self->_realSet, v15, a5);
    if (*((_QWORD *)&v17 + 1))
    {
      if (v15)
        CFRelease(v15);
    }
    else
    {
      *((_QWORD *)&v16 + 1) = v16;
    }

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v11 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v11;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "insertObjects:count:atIndex:", a3, a4, a5);
  }
}

- (_BYTE)willChange
{
  _BYTE *v1;

  if (result)
  {
    v1 = result;
    result = (_BYTE *)objc_msgSend(result, "willRead");
    if ((v1[12] & 0x10) != 0)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot mutate an immutable faulting NSOrderedSet"), 0));
  }
  return result;
}

- (void)addObjects:(const void *)a3 count:(unint64_t)a4
{
  unsigned int *orderKeys;
  void *v8;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  const __CFAllocator *v11;
  CFArrayRef v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (a4 > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = _PFStackAllocatorCreate((unint64_t *)&v13, 1024);
    v12 = CFArrayCreate(v11, a3, a4, 0);
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, self->_realSet, v12);
    if (*((_QWORD *)&v14 + 1))
    {
      if (v12)
        CFRelease(v12);
    }
    else
    {
      *((_QWORD *)&v13 + 1) = v13;
    }

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v8 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v8;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "addObjects:count:", a3, a4);
  }
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_NSFaultingMutableOrderedSet)initWithOrderedSet:(id)a3
{
  _NSFaultingMutableOrderedSet *v4;
  _NSFaultingMutableOrderedSet *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSFaultingMutableOrderedSet;
  v4 = -[_NSFaultingMutableOrderedSet init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_source = 0;
    v4->_realSet = a3;
    *(_DWORD *)&v5->_flags &= 0xFFE0u;
  }
  return v5;
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

- (id)description
{
  _NSFaultingMutableOrderedSetFlags flags;
  void *v4;
  NSString *v5;
  NSManagedObject *source;
  uint64_t v8;

  flags = self->_flags;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0)
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("Relationship '%@' fault on managed object (%p) %@"), v5, self->_source, source, v8);
  else
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("Relationship '%@' on managed object (%p) %@ with objects %@"), v5, source, source, objc_msgSend(self->_realSet, "description"));
}

- (id)descriptionWithLocale:(id)a3
{
  _NSFaultingMutableOrderedSetFlags flags;
  void *v6;
  NSString *v7;
  NSManagedObject *source;
  uint64_t v10;

  flags = self->_flags;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name");
  source = self->_source;
  if ((*(_BYTE *)&flags & 1) != 0)
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Relationship '%@' fault on managed object (%p) %@"), v7, self->_source, source, v10);
  else
    return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("Relationship '%@' on managed object (%p) %@ with objects %@"), v7, source, source, objc_msgSend(self->_realSet, "descriptionWithLocale:", a3));
}

- (id)_updateOrderKeysFromOrderOfObjectIDs:(id *)result
{
  id *v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void **v9;
  size_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  const __CFAllocator *v21;
  const __CFDictionary *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t i;
  const void *Value;
  id v30;
  uint64_t v31;
  unint64_t v32;
  const void **v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  CFDictionaryKeyCallBacks v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    if (objc_msgSend(result[2], "count"))
    {
      v4 = objc_msgSend(v3[2], "count");
      if (!v3[4])
        v3[4] = PF_CALLOC_UNSCANNED_BYTES(4 * v4);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v5 = objc_msgSend(a2, "count");
      v6 = MEMORY[0x1E0C80A78](v5);
      v9 = (const void **)((char *)&v31 - v8);
      v10 = 8 * v7;
      v31 = v11;
      v32 = v6;
      if (v6 > 0x200)
      {
        v9 = (const void **)NSAllocateScannedUncollectable();
        v34 = (char *)NSAllocateScannedUncollectable();
      }
      else
      {
        bzero((char *)&v31 - v8, 8 * v7);
        MEMORY[0x1E0C80A78](v12);
        v34 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v34, v10);
      }
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, v31);
      v33 = v9;
      if (v13)
      {
        v14 = v13;
        v15 = 0;
        v16 = *(_QWORD *)v41;
        do
        {
          v17 = 0;
          v18 = (char *)&v9[v15];
          v19 = &v34[8 * v15];
          do
          {
            if (*(_QWORD *)v41 != v16)
              objc_enumerationMutation(a2);
            v20 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v17);
            *(_QWORD *)&v19[8 * v17] = v15 + v17 + 1;
            *(_QWORD *)&v18[8 * v17++] = v20;
          }
          while (v14 != v17);
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          v15 += v17;
          v9 = v33;
        }
        while (v14);
      }
      v21 = _PFStackAllocatorCreate((unint64_t *)&v46, 1024);
      memset(&v39, 0, 24);
      *(_OWORD *)&v39.copyDescription = *(_OWORD *)(MEMORY[0x1E0C9B390] + 24);
      v39.hash = *(CFDictionaryHashCallBack *)(MEMORY[0x1E0C9B390] + 40);
      v22 = CFDictionaryCreate(v21, v9, (const void **)v34, v32, &v39, 0);
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v23 = v3[2];
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      if (v24)
      {
        v25 = v24;
        v26 = 0;
        v27 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v23);
            Value = CFDictionaryGetValue(v22, (const void *)objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "objectID"));
            if (Value)
              *((_DWORD *)v3[4] + (v26 + i)) = *(_DWORD *)(a2[4] + 4 * ((_DWORD)Value - 1));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          v26 += i;
        }
        while (v25);
      }
      if (v32 >= 0x201)
      {
        NSZoneFree(0, v34);
        NSZoneFree(0, v33);
      }
      if (*((_QWORD *)&v47 + 1))
      {
        if (v22)
          CFRelease(v22);
      }
      else
      {
        *((_QWORD *)&v46 + 1) = v46;
      }
    }
    v30 = v3[5];
    if (v30)

    result = a2;
    v3[5] = result;
  }
  return result;
}

- (void)turnIntoFault
{
  id *realSet;
  unsigned int *orderKeys;

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
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v7;

  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys && objc_msgSend(self->_realSet, "indexOfObject:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v7 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  objc_msgSend(self->_realSet, "insertObject:atIndex:", a3, a4);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  objc_msgSend(self->_realSet, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, a5);
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "indexOfObjectWithOptions:passingTest:", a3, a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "indexesOfObjectsWithOptions:passingTest:", a3, a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)objectEnumerator
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return (id)objc_msgSend(self->_realSet, "objectEnumerator");
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unsigned int *orderKeys;
  void *v6;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v6;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  objc_msgSend(self->_realSet, "removeObjectAtIndex:", a3);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v7;
  void *v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys)
  {
    v7 = objc_msgSend(self->_realSet, "indexOfObject:", a4);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 != a3)
    {
      PF_FREE_OBJECT_ARRAY(self->_orderKeys);
      self->_orderKeys = 0;
    }
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v9 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v9;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  objc_msgSend(self->_realSet, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  void *v7;

  -[_NSFaultingMutableOrderedSet willChange](self);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v7 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v7;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  objc_msgSend(self->_realSet, "setValue:forKey:", a3, a4);
}

- (id)valueForKeyPath:(id)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
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
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead", a3);
  return self->_realSet;
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
          v6 = -[_NSFaultingMutableOrderedSet relationship](self, "relationship");
          if (v6 == (NSPropertyDescription *)objc_msgSend(a3, "relationship"))
            return 1;
        }
      }
    }
  }
  return 0;
}

- (BOOL)containsObject:(id)a3
{
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  return objc_msgSend(self->_realSet, "containsObject:", a3);
}

- (void)addObject:(id)a3
{
  void *v5;

  -[_NSFaultingMutableOrderedSet willChange](self);
  if (self->_orderKeys && objc_msgSend(self->_realSet, "indexOfObject:", a3) == 0x7FFFFFFFFFFFFFFFLL)
  {
    PF_FREE_OBJECT_ARRAY(self->_orderKeys);
    self->_orderKeys = 0;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    v5 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v5;
    *(_DWORD *)&self->_flags &= ~8u;
  }
  objc_msgSend(self->_realSet, "insertObject:atIndex:", a3, objc_msgSend(self->_realSet, "count"));
}

- (void)addObjectsFromArray:(id)a3
{
  unsigned int *orderKeys;
  void *v6;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "addObjectsFromArray:", a3);
  }
}

- (void)insertObjects:(id)a3 atIndexes:(id)a4
{
  unsigned int *orderKeys;
  unint64_t v8;
  void *v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  v8 = objc_msgSend(a4, "firstIndex");
  if (v8 >= objc_msgSend(self->_realSet, "count"))
  {
    -[_NSFaultingMutableOrderedSet addObjectsFromArray:](self, "addObjectsFromArray:", a3);
  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v9 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v9;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "insertObjects:atIndexes:", a3, a4);
  }
}

- (void)removeAllObjects
{
  _NSFaultingMutableOrderedSetFlags flags;
  unsigned int *orderKeys;

  -[_NSFaultingMutableOrderedSet willChange](self);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }

  self->_realSet = objc_alloc_init(MEMORY[0x1E0C99E10]);
}

- (void)removeObjectsInArray:(id)a3
{
  unint64_t v5;
  unsigned int *orderKeys;
  void *v7;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v10;

  -[_NSFaultingMutableOrderedSet willChange](self);
  v5 = objc_msgSend(a3, "count");
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if (v5 > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v10 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v7 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v7;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "removeObjectsInArray:", a3);
  }
}

- (void)minusOrderedSet:(id)a3
{
  unsigned int *orderKeys;
  void *v6;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "minusOrderedSet:", a3);
  }
}

- (void)unionOrderedSet:(id)a3
{
  unsigned int *orderKeys;
  void *v6;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "unionOrderedSet:", a3);
  }
}

- (void)minusSet:(id)a3
{
  unsigned int *orderKeys;
  void *v6;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byRemovingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "minusSet:", a3);
  }
}

- (void)unionSet:(id)a3
{
  unsigned int *orderKeys;
  void *v6;
  id realSet;
  _NSFaultingMutableOrderedSetFlags flags;
  id v9;

  -[_NSFaultingMutableOrderedSet willChange](self);
  orderKeys = self->_orderKeys;
  if (orderKeys)
  {
    PF_FREE_OBJECT_ARRAY(orderKeys);
    self->_orderKeys = 0;
  }
  if ((unint64_t)objc_msgSend(a3, "count") > 2)
  {
    realSet = self->_realSet;
    flags = self->_flags;
    v9 = realSet;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      self->_flags = (_NSFaultingMutableOrderedSetFlags)(*(_DWORD *)&flags & 0xFFFFFFF7);
      realSet = self->_realSet;
    }
    self->_realSet = +[_PFRoutines newOrderedSetFromCollection:byAddingItems:]((uint64_t)_PFRoutines, realSet, a3);

  }
  else
  {
    if ((*(_BYTE *)&self->_flags & 8) != 0)
    {
      v6 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

      self->_realSet = v6;
      *(_DWORD *)&self->_flags &= ~8u;
    }
    objc_msgSend(self->_realSet, "unionSet:", a3);
  }
}

- (void)sortUsingComparator:(id)a3
{
  -[_NSFaultingMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, a3);
}

- (void)sortWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  -[_NSFaultingMutableOrderedSet sortRange:options:usingComparator:](self, "sortRange:options:usingComparator:", 0, 0x7FFFFFFFFFFFFFFFLL, a3, a4);
}

- (void)sortRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSFetchRequest *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _DWORD *v24;
  int v25;
  BOOL v26;
  void *v27;
  id v28;
  NSUInteger v29;
  id v30;
  NSUInteger *v31;
  unint64_t v32;
  uint64_t v33;
  objc_super v34;
  uint64_t v35;

  length = a3.length;
  location = a3.location;
  v35 = *MEMORY[0x1E0C80C00];
  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  v10 = 12;
  v11 = objc_msgSend(*(id *)((_QWORD)-[NSManagedObject entity](self->_source, "entity")[96]+ 24+ (((unint64_t)self->_flags >> 13) & 0x7FFF8)), "name");
  if (-[NSManagedObject hasFaultForRelationshipNamed:](self->_source, "hasFaultForRelationshipNamed:", v11))
  {
    v12 = location;
    v13 = objc_alloc_init(NSFetchRequest);
    -[NSFetchRequest setEntity:](v13, "setEntity:", -[NSManagedObject entity](self->_source, "entity"));
    -[NSFetchRequest setRelationshipKeyPathsForPrefetching:](v13, "setRelationshipKeyPathsForPrefetching:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v11));
    -[NSFetchRequest setPredicate:](v13, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self == %@"), -[NSManagedObject objectID](self->_source, "objectID")));
    -[NSFetchRequest setReturnsObjectsAsFaults:](v13, "setReturnsObjectsAsFaults:", 0);
    -[NSFetchRequest setIncludesPendingChanges:](v13, "setIncludesPendingChanges:", 0);
    if (!v13)
    {
LABEL_6:
      location = v12;
      goto LABEL_7;
    }
LABEL_5:
    -[NSManagedObjectContext executeFetchRequest:error:](-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), "executeFetchRequest:error:", v13, 0);
    goto LABEL_6;
  }
  v33 = 12;
  v15 = -[NSManagedObject valueForKey:](self->_source, "valueForKey:", v11);
  v16 = objc_msgSend(v15, "count");
  if (length == 0x7FFFFFFFFFFFFFFFLL)
    length = v16;
  if (v16)
  {
    v17 = v16;
    v31 = &v29;
    v32 = a4;
    v18 = MEMORY[0x1E0C80A78](v16);
    v20 = (char *)&v29 - v19;
    if (v18 > 0x200)
      v20 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v29 - v19, 8 * v18);
    objc_msgSend(v15, "getObjects:", v20);
    if (location >= v17 + location)
    {
      v21 = 0;
    }
    else
    {
      v29 = location;
      v30 = a5;
      v21 = 0;
      v22 = 8 * location;
      v23 = v17;
      do
      {
        v24 = *(_DWORD **)&v20[v22];
        v25 = (v24[4] >> 15) & 7;
        if (v25)
          v26 = v25 == 5;
        else
          v26 = 1;
        if (!v26)
        {
          v27 = (void *)objc_msgSend(v24, "objectID");
          if ((objc_msgSend(v27, "isTemporaryID") & 1) == 0)
            *(_QWORD *)&v20[8 * v21++] = v27;
        }
        v22 += 8;
        --v23;
      }
      while (v23);
      if (v21)
        v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v20, v21);
      location = v29;
      a5 = v30;
    }
    if (v17 >= 0x201)
      NSZoneFree(0, v20);
    v12 = location;
    if (objc_msgSend((id)v21, "count", v29, v30))
    {
      v28 = -[NSDictionary objectForKey:](-[NSEntityDescription relationshipsByName](-[NSManagedObject entity](self->_source, "entity"), "relationshipsByName"), "objectForKey:", v11);
      v13 = objc_alloc_init(NSFetchRequest);
      -[NSFetchRequest setEntity:](v13, "setEntity:", objc_msgSend(v28, "destinationEntity"));
      -[NSFetchRequest setPredicate:](v13, "setPredicate:", objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v21));
      -[NSFetchRequest setReturnsObjectsAsFaults:](v13, "setReturnsObjectsAsFaults:", 0);
      -[NSFetchRequest setIncludesPendingChanges:](v13, "setIncludesPendingChanges:", 0);
    }
    else
    {
      v13 = 0;
    }
    a4 = v32;

    v10 = v33;
    if (!v13)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = v33;
LABEL_7:
  -[_NSFaultingMutableOrderedSet willChange](self);
  if ((*((_BYTE *)&self->super.super.super.isa + v10) & 8) != 0)
  {
    v14 = (void *)objc_msgSend(self->_realSet, "mutableCopy");

    self->_realSet = v14;
    *(_DWORD *)((char *)&self->super.super.super.isa + v10) &= ~8u;
  }
  if (length == 0x7FFFFFFFFFFFFFFFLL)
    length = objc_msgSend(self->_realSet, "count");
  v34.receiver = self;
  v34.super_class = (Class)_NSFaultingMutableOrderedSet;
  -[_NSFaultingMutableOrderedSet sortRange:options:usingComparator:](&v34, sel_sortRange_options_usingComparator_, location, length, a4, a5);
}

- (id)allObjects
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[_NSFaultingMutableOrderedSet willRead](self, "willRead");
  v3 = objc_msgSend(self->_realSet, "count");
  v4 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v10 - v6;
  if (v4 > 0x200)
    v7 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v10 - v6, 8 * v5);
  objc_msgSend(self->_realSet, "getObjects:range:", v7, 0, v3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v3);
  if (v3 >= 0x201)
    NSZoneFree(0, v7);
  return v8;
}

- (id)_orderedObjectsAndKeys
{
  NSManagedObject *source;
  void *v3;
  uint64_t v4;

  source = self->_source;
  if (source && (source->_cd_stateFlags & 0x38) != 0)
  {
    v3 = 0;
  }
  else
  {
    if (source)
      v4 = _insertion_fault_handler;
    else
      v4 = 0;
    v3 = (void *)-[NSFaultHandler retainedOrderedFaultInformationForAggregateFaultForObject:andRelationship:withContext:error:](v4, source, -[_NSFaultingMutableOrderedSet relationship](self, "relationship"), (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), 0);
  }
  return v3;
}

- (BOOL)_reorderObjectsToLocationsByOrderKey:(id)a3 error:(id *)a4
{
  NSManagedObject *source;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char flags;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSManagedObjectContext *v25;
  uint64_t v26;
  char *v27;
  uint64_t i;
  void *v29;
  uint64_t j;
  objc_class *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v43[2];
  id v44;
  id v45;
  uint64_t v46;
  const __CFString *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];

  self->_forcedKeys = 0;
  if ((objc_msgSend(a3, "count") & 1) != 0)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB28A8];
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("bad input oidsAndLocations => should have an even number"), CFSTR("Reason"), 0);
      v20 = v17;
      v21 = v18;
LABEL_14:
      v24 = (void *)objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 134060, v19);
      LOBYTE(v9) = 0;
      *a4 = v24;
      return (char)v9;
    }
LABEL_15:
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  source = self->_source;
  if (source)
    v8 = _insertion_fault_handler;
  else
    v8 = 0;
  v9 = (void *)-[NSFaultHandler retainedOrderedFaultInformationForAggregateFaultForObject:andRelationship:withContext:error:](v8, source, -[_NSFaultingMutableOrderedSet relationship](self, "relationship"), (uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a4);
  if (!v9)
    return (char)v9;
  v10 = v9;
  if (objc_msgSend(v9, "count") != 2)
  {

    if (a4)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB28A8];
      v47 = CFSTR("message");
      v48[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("failed to retrieve ordering information from fault for object %@ and relationship %@"), -[NSManagedObject objectID](self->_source, "objectID"), -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name"));
      v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v20 = v22;
      v21 = v23;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v11 = (id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 0), "mutableCopy");
  v12 = (id)objc_msgSend((id)objc_msgSend(v10, "objectAtIndex:", 1), "mutableCopy");
  v13 = objc_msgSend(v11, "count");
  if (v13)
  {
    v14 = v13;
    v46 = 48;
    flags = (char)self->_flags;
    v44 = v10;
    if ((flags & 1) != 0)
    {
      v16 = 0;
    }
    else
    {
      v16 = self->_realSet;
      -[_NSFaultingMutableOrderedSet turnIntoFault](self, "turnIntoFault");
    }
    v25 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    v43[1] = v43;
    MEMORY[0x1E0C80A78](v25);
    v27 = (char *)v43 - v26;
    if (v14 > 0x200)
      v27 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v43 - v26, 8 * v14);
    objc_msgSend(v11, "getObjects:range:", v27, 0, v14);
    for (i = 0; i != v14; ++i)
      *(_QWORD *)&v27[8 * i] = -[NSManagedObjectContext _retainedObjectWithID:optionalHandler:withInlineStorage:](v25, *(void **)&v27[8 * i], 0);
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v27, v14);
    -[_NSFaultingMutableOrderedSet willReadWithContents:](self, "willReadWithContents:", v29);

    for (j = 0; j != v14; ++j)
    if (v14 >= 0x201)
      NSZoneFree(0, v27);
    if (v16)

    v31 = (objc_class *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", v14);
    *(Class *)((char *)&self->super.super.super.isa + v46) = v31;
    v32 = objc_msgSend(a3, "count");
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:copyItems:", v11, 0);
    v45 = -[NSManagedObject mutableOrderedSetValueForKey:](self->_source, "mutableOrderedSetValueForKey:", -[NSPropertyDescription name](-[_NSFaultingMutableOrderedSet relationship](self, "relationship"), "name"));
    if (v32)
    {
      v34 = 0;
      do
      {
        v35 = objc_msgSend(a3, "objectAtIndex:", v34);
        v36 = v34 + 1;
        v37 = objc_msgSend(a3, "objectAtIndex:", v34 + 1);
        v38 = objc_msgSend(v33, "indexOfObject:", v35);
        if (v38 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v39 = v38;
          if ((objc_msgSend((id)objc_msgSend(v12, "objectAtIndex:", v38), "isEqual:", v37) & 1) == 0)
          {
            objc_msgSend(v12, "removeObjectAtIndex:", v39);
            objc_msgSend(v33, "removeObjectAtIndex:", v39);
            v40 = objc_msgSend(v12, "indexOfObject:inSortedRange:options:usingComparator:", v37, 0, objc_msgSend(v12, "count"), 1024, &__block_literal_global_155);
            v41 = objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v39);
            objc_msgSend(v45, "moveObjectsAtIndexes:toIndex:", v41, v40);
            objc_msgSend(v12, "insertObject:atIndex:", v37, v40);
            objc_msgSend(v33, "insertObject:atIndex:", v35, v40);
            objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v46), "setObject:forKey:", v37, v35);
          }
        }
        v34 = v36 + 1;
      }
      while (v36 + 1 < v32);
    }

    LOBYTE(v9) = 1;
  }
  else
  {

    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

@end
