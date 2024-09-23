@implementation _PFFetchedResultOrderedSetWrapper

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFFetchedResultOrderedSetWrapper)initWithArray:(id)a3 andContext:(id)a4
{
  _PFFetchedResultOrderedSetWrapper *v6;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PFFetchedResultOrderedSetWrapper;
  v6 = -[_PFFetchedResultOrderedSetWrapper init](&v9, sel_init);
  if (!v6)
    return v6;
  if (!objc_msgSend(a3, "count"))
  {

    return (_PFFetchedResultOrderedSetWrapper *)objc_alloc_init(MEMORY[0x1E0C99E40]);
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {

    return (_PFFetchedResultOrderedSetWrapper *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E40]), "initWithArray:", a3);
  }
  v6->_underlyingArray = (NSArray *)a3;
  if (a4
    && _PF_shouldAsyncProcessReferenceQueue
    && (objc_msgSend(a4, "concurrencyType") == 1 || objc_msgSend(a4, "concurrencyType") == 2))
  {
    v6->_weakmoc = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a4);
  }
  return v6;
}

- (_PFFetchedResultOrderedSetWrapper)retain
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
          -[_PFFetchedResultOrderedSetWrapper dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
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

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (void)dealloc
{
  NSUInteger v3;
  _PFWeakReference *weakmoc;
  id WeakRetained;
  void *v6;

  v3 = -[NSArray count](self->_underlyingArray, "count");

  if (v3)
  {
    weakmoc = self->_weakmoc;
    if (weakmoc)
    {
      WeakRetained = objc_loadWeakRetained(&weakmoc->_object);
      if (WeakRetained)
      {
        v6 = WeakRetained;
        -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);

      }
    }
  }

  _PFDeallocateObject(self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSOrderedSet wrapper '%@' for fetch request results: %@"), self, self->_underlyingArray);
}

- (id)descriptionWithLocale:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSOrderedSet wrapper '%@' for fetch request results: %@"), self, self->_underlyingArray);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithArray:", self->_underlyingArray);
}

- (unint64_t)count
{
  return -[NSArray count](self->_underlyingArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_underlyingArray, "objectAtIndex:", a3);
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_underlyingArray, "indexOfObject:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSArray countByEnumeratingWithState:objects:count:](self->_underlyingArray, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSArray enumerateObjectsWithOptions:usingBlock:](self->_underlyingArray, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  -[NSArray enumerateObjectsAtIndexes:options:usingBlock:](self->_underlyingArray, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, a5);
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSArray indexOfObjectWithOptions:passingTest:](self->_underlyingArray, "indexOfObjectWithOptions:passingTest:", a3, a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSArray indexOfObjectAtIndexes:options:passingTest:](self->_underlyingArray, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSArray indexesOfObjectsWithOptions:passingTest:](self->_underlyingArray, "indexesOfObjectsWithOptions:passingTest:", a3, a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSArray indexesOfObjectsAtIndexes:options:passingTest:](self->_underlyingArray, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)sortedArrayUsingComparator:(id)a3
{
  return -[NSArray sortedArrayUsingComparator:](self->_underlyingArray, "sortedArrayUsingComparator:", a3);
}

- (id)sortedArrayWithOptions:(unint64_t)a3 usingComparator:(id)a4
{
  return -[NSArray sortedArrayWithOptions:usingComparator:](self->_underlyingArray, "sortedArrayWithOptions:usingComparator:", a3, a4);
}

- (id)array
{
  return self->_underlyingArray;
}

- (id)objectEnumerator
{
  return -[NSArray objectEnumerator](self->_underlyingArray, "objectEnumerator");
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  -[NSArray getObjects:range:](self->_underlyingArray, "getObjects:range:", a3, a4.location, a4.length);
}

- (void)getObjects:(id *)a3
{
  -[NSArray getObjects:range:](self->_underlyingArray, "getObjects:range:", a3, 0, -[NSArray count](self->_underlyingArray, "count"));
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (BOOL)isEqualToOrderedSet:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
    goto LABEL_13;
  v5 = -[_PFFetchedResultOrderedSetWrapper count](self, "count");
  if (v5 != objc_msgSend(a3, "count"))
  {
    LOBYTE(v13) = 0;
    return v13;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v6)
  {
LABEL_13:
    LOBYTE(v13) = 1;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(a3);
      v11 = *(id *)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12 = -[NSArray objectAtIndex:](self->_underlyingArray, "objectAtIndex:", v8 + v10);
      if (v12 != v11)
      {
        v13 = objc_msgSend(v12, "isEqual:", v11);
        if (!v13)
          break;
      }
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        v8 += v10;
        LOBYTE(v13) = 1;
        if (v7)
          goto LABEL_5;
        return v13;
      }
    }
  }
  return v13;
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
      LOBYTE(v5) = -[_PFFetchedResultOrderedSetWrapper isEqualToOrderedSet:](self, "isEqualToOrderedSet:", a3);
  }
  return v5;
}

- (BOOL)containsObject:(id)a3
{
  return -[NSArray indexOfObject:](self->_underlyingArray, "indexOfObject:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)allObjects
{
  return self->_underlyingArray;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  return (id)-[NSArray managedObjectIDAtIndex:](self->_underlyingArray, "managedObjectIDAtIndex:", a3);
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  return -[NSArray indexOfManagedObjectForObjectID:](self->_underlyingArray, "indexOfManagedObjectForObjectID:", a3);
}

- (id)arrayFromObjectIDs
{
  return (id)-[NSArray arrayFromObjectIDs](self->_underlyingArray, "arrayFromObjectIDs");
}

- (id)newArrayFromObjectIDs
{
  return (id)-[NSArray newArrayFromObjectIDs](self->_underlyingArray, "newArrayFromObjectIDs");
}

@end
