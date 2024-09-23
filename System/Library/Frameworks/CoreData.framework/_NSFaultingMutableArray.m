@implementation _NSFaultingMutableArray

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (id)alloc
{
  return _PFAllocateObject((Class)a1, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return _PFAllocateObject((Class)a1, 0);
}

- (_NSFaultingMutableArray)retain
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
          -[_NSFaultingMutableArray dealloc](self, "dealloc");
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

- (_NSFaultingMutableArray)initWithSource:(id)a3 forRelationship:(id)a4 asFault:(BOOL)a5
{
  _BOOL4 v5;
  _NSFaultingMutableArray *v8;
  _NSFaultingMutableArray *v9;
  NSMutableArray *v10;
  objc_super v12;

  v5 = a5;
  v12.receiver = self;
  v12.super_class = (Class)_NSFaultingMutableArray;
  v8 = -[_NSFaultingMutableArray init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_source = (NSManagedObject *)a3;
    v8->_relationship = (NSPropertyDescription *)a4;
    if (v5)
    {
      v10 = 0;
      v9->_flags = (_NSFaultingMutableArrayFlags)1;
    }
    else
    {
      v8->_flags = 0;
      v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    }
    v9->_realArray = v10;
  }
  return v9;
}

- (void)dealloc
{

  self->_realArray = 0;
  self->_source = 0;
  self->_relationship = 0;
  _PFDeallocateObject(self);
}

- (BOOL)isFault
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)willRead
{
  NSManagedObjectContext *v3;
  NSManagedObject *source;
  uint64_t v5;
  NSMutableArray *v6;

  if (_PF_Threading_Debugging_level)
    _PFAssertSafeMultiThreadedAccess_impl((uint64_t)-[NSManagedObject managedObjectContext](self->_source, "managedObjectContext"), a2);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = -[NSManagedObject managedObjectContext](self->_source, "managedObjectContext");
    source = self->_source;
    if (source)
      v5 = _insertion_fault_handler;
    else
      v5 = 0;
    v6 = (NSMutableArray *)-[NSFaultHandler retainedFulfillAggregateFaultForObject:andRelationship:withContext:](v5, source, self->_relationship, (uint64_t)v3);
    self->_realArray = v6;
    if (!v6)
      self->_realArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    *(_DWORD *)&self->_flags &= ~1u;
  }
}

- (void)turnIntoFault
{

  self->_realArray = 0;
  *(_DWORD *)&self->_flags |= 1u;
}

- (NSManagedObject)source
{
  return self->_source;
}

- (NSPropertyDescription)relationship
{
  return self->_relationship;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _NSFaultingMutableArrayFlags flags;
  _NSFaultingMutableArray *v5;
  NSManagedObject *source;
  NSPropertyDescription *relationship;
  id *v8;

  flags = self->_flags;
  v5 = [_NSFaultingMutableArray alloc];
  source = self->_source;
  relationship = self->_relationship;
  if ((*(_BYTE *)&flags & 1) != 0)
    return -[_NSFaultingMutableArray initWithSource:forRelationship:asFault:](v5, "initWithSource:forRelationship:asFault:", source, relationship, 1);
  v8 = -[_NSFaultingMutableArray initWithSource:forRelationship:asFault:](v5, "initWithSource:forRelationship:asFault:", source, relationship, 0);
  objc_msgSend(v8[2], "setArray:", self->_realArray);
  return v8;
}

- (id)description
{
  NSManagedObject *source;
  uint64_t v4;

  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship fault for %@ on %p"), self->_relationship, source, v4);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship objects for %@ on %p: %@"), self->_relationship, source, -[NSMutableArray description](self->_realArray, "description"));
}

- (id)descriptionWithLocale:(id)a3
{
  NSManagedObject *source;
  uint64_t v5;

  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship fault for %@ on %p"), self->_relationship, source, v5);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship objects for %@ on %p: %@"), self->_relationship, source, -[NSMutableArray descriptionWithLocale:](self->_realArray, "descriptionWithLocale:", a3));
}

- (id)descriptionWithLocale:(id)a3 indent:(unint64_t)a4
{
  NSManagedObject *source;
  uint64_t v6;

  source = self->_source;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship fault for %@ on %p"), self->_relationship, source, v6);
  else
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Relationship objects for %@ on %p: %@"), self->_relationship, source, -[NSMutableArray descriptionWithLocale:indent:](self->_realArray, "descriptionWithLocale:indent:", a3, a4));
}

- (unint64_t)count
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return -[NSMutableArray count](self->_realArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray objectAtIndex:](self->_realArray, "objectAtIndex:", a3);
}

- (void)addObject:(id)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray addObject:](self->_realArray, "addObject:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_realArray, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_realArray, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)enumerateObjectsAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](self->_realArray, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, a5);
}

- (unint64_t)indexOfObjectWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return -[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_realArray, "indexOfObjectWithOptions:passingTest:", a3, a4);
}

- (unint64_t)indexOfObjectAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return -[NSMutableArray indexOfObjectAtIndexes:options:passingTest:](self->_realArray, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)indexesOfObjectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray indexesOfObjectsWithOptions:passingTest:](self->_realArray, "indexesOfObjectsWithOptions:passingTest:", a3, a4);
}

- (id)indexesOfObjectsAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray indexesOfObjectsAtIndexes:options:passingTest:](self->_realArray, "indexesOfObjectsAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)objectEnumerator
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray objectEnumerator](self->_realArray, "objectEnumerator");
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray insertObject:atIndex:](self->_realArray, "insertObject:atIndex:", a3, a4);
}

- (void)removeLastObject
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray removeLastObject](self->_realArray, "removeLastObject");
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray removeObjectAtIndex:](self->_realArray, "removeObjectAtIndex:", a3);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_realArray, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)getObjects:(id *)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray getObjects:](self->_realArray, "getObjects:", a3);
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  -[NSMutableArray setValue:forKey:](self->_realArray, "setValue:forKey:", a3, a4);
}

- (id)valueForKey:(id)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray valueForKey:](self->_realArray, "valueForKey:", a3);
}

- (id)valueForKeyPath:(id)a3
{
  -[_NSFaultingMutableArray willRead](self, "willRead");
  return (id)-[NSMutableArray valueForKeyPath:](self->_realArray, "valueForKeyPath:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

@end
