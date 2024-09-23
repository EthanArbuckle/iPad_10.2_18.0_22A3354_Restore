@implementation _PFMutableProxyArray

- (void)removeObjectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex;
  unsigned int editCount;

  ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  CFArrayRemoveValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_updatedObjectsArray, "replaceObjectAtIndex:withObject:", ValueAtIndex & 0x7FFFFFFF, NSKeyValueCoding_NullValue);
    editCount = self->_editCount;
    if (editCount)
      self->_editCount = editCount - 1;
  }
}

- (unint64_t)count
{
  return CFArrayGetCount(self->_indicesVeneer);
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  int v7;

  v7 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a3);
  CFArrayInsertValueAtIndex(self->_indicesVeneer, a4, (const void *)(v7 & 0x7FFFFFFF | 0x80000000));
}

- (id)objectAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex;
  void *updatedObjectsArray;
  uint64_t v6;

  ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
  {
    updatedObjectsArray = self->_updatedObjectsArray;
    v6 = ValueAtIndex & 0x7FFFFFFF;
  }
  else
  {
    updatedObjectsArray = self->_originalArray;
    v6 = self->_offset + ValueAtIndex;
  }
  return (id)objc_msgSend(updatedObjectsArray, "objectAtIndex:", v6);
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(id, char *, id);
  unint64_t v8;
  id v9;

  v5 = -[_PFMutableProxyArray count](self, "count");
  v6 = objc_msgSend(a3, "methodForSelector:", sel_isEqual_);
  if (!v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = (uint64_t (*)(id, char *, id))v6;
  v8 = 0;
  while (1)
  {
    v9 = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", v8);
    if (v9 == a3 || (v7(a3, sel_isEqual_, v9) & 1) != 0)
      break;
    if (v5 == ++v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (id)newArrayFromObjectIDs
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = -[_PFMutableProxyArray count](self, "count");
  v4 = v3;
  if (v3 <= 1)
    v5 = 1;
  else
    v5 = v3;
  if (v3 >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x201)
  {
    v7 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v11 - ((8 * v6 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v5);
    if (!v4)
      goto LABEL_13;
  }
  v8 = 0;
  do
  {
    *(_QWORD *)&v7[8 * v8] = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", v8);
    ++v8;
  }
  while (v4 != v8);
LABEL_13:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v7);
  return v9;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  unsigned int ValueAtIndex;

  ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, a3);
  if ((ValueAtIndex & 0x80000000) != 0)
    return (id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->_updatedObjectsArray, "objectAtIndex:", ValueAtIndex & 0x7FFFFFFF), "objectID");
  else
    return -[_PFArray managedObjectIDAtIndex:](self->_originalArray, "managedObjectIDAtIndex:", self->_offset + ValueAtIndex);
}

- (id)arrayFromObjectIDs
{
  return -[_PFMutableProxyArray newArrayFromObjectIDs](self, "newArrayFromObjectIDs");
}

- (id)copy
{
  return -[_PFMutableProxyArray copyWithZone:](self, "copyWithZone:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t i;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = -[_PFMutableProxyArray count](self, "count", a3);
  v5 = (void *)MEMORY[0x18D76B4E4]();
  if (v4 <= 1)
    v6 = 1;
  else
    v6 = v4;
  if (v4 >= 0x201)
    v7 = 1;
  else
    v7 = v6;
  v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 >= 0x201)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
    if (!v4)
      goto LABEL_13;
  }
  for (i = 0; i != v4; ++i)
    *(_QWORD *)&v8[8 * i] = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", i);
LABEL_13:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v8, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v8);
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (_PFMutableProxyArray)initWithPFArray:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  unsigned int location;
  _PFMutableProxyArray *v7;
  char *i;
  objc_super v10;

  length = a4.length;
  location = a4.location;
  v10.receiver = self;
  v10.super_class = (Class)_PFMutableProxyArray;
  v7 = -[_PFMutableProxyArray init](&v10, sel_init);
  if (v7)
  {
    v7->_originalArray = (_PFArray *)a3;
    v7->_offset = location;
    v7->_limit = location + length;
    v7->_updatedObjectsArray = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7->_editCount = length + 1;
    v7->_indicesVeneer = CFArrayCreateMutable(0, 0, 0);
    if (length)
    {
      for (i = 0; i != (char *)length; ++i)
        CFArrayAppendValue(v7->_indicesVeneer, i);
    }
  }
  return v7;
}

- (_PFMutableProxyArray)initWithPFArray:(id)a3
{
  return -[_PFMutableProxyArray initWithPFArray:inRange:](self, "initWithPFArray:inRange:", a3, 0, objc_msgSend(a3, "count"));
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _PFMutableProxyArray *v6;
  __CFArray *indicesVeneer;
  NSMutableArray *updatedObjectsArray;
  int v9;
  int v10;
  CFIndex i;
  unsigned int ValueAtIndex;
  _PFMutableProxyArray *v14;

  length = a3.length;
  location = a3.location;
  v6 = -[_PFMutableProxyArray initWithPFArray:inRange:]([_PFMutableProxyArray alloc], "initWithPFArray:inRange:", self->_originalArray, a3.location, a3.length);
  v6->_offset = self->_offset;
  indicesVeneer = v6->_indicesVeneer;
  v14 = v6;
  updatedObjectsArray = v6->_updatedObjectsArray;
  v9 = -[NSMutableArray count](updatedObjectsArray, "count");
  if (length)
  {
    v10 = v9;
    for (i = 0; i != length; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, location + i);
      if ((ValueAtIndex & 0x80000000) != 0)
      {
        -[NSMutableArray addObject:](updatedObjectsArray, "addObject:", -[NSMutableArray objectAtIndex:](self->_updatedObjectsArray, "objectAtIndex:", ValueAtIndex & 0x7FFFFFFF));
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)(v10++ | 0x80000000));
      }
      else
      {
        CFArraySetValueAtIndex(indicesVeneer, i, (const void *)ValueAtIndex);
      }
    }
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_PFMutableProxyArray;
  -[_PFMutableProxyArray dealloc](&v3, sel_dealloc);
}

- (_PFMutableProxyArray)retain
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
          -[_PFMutableProxyArray dealloc](self, "dealloc");
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

- (id)mutableCopy
{
  return -[_PFMutableProxyArray mutableCopyWithZone:](self, "mutableCopyWithZone:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t i;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = -[_PFMutableProxyArray count](self, "count", a3);
  v5 = (void *)MEMORY[0x18D76B4E4]();
  if (v4 <= 1)
    v6 = 1;
  else
    v6 = v4;
  if (v4 >= 0x201)
    v7 = 1;
  else
    v7 = v6;
  v8 = (char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v4 >= 0x201)
  {
    v8 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v12 - ((8 * v7 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v6);
    if (!v4)
      goto LABEL_13;
  }
  for (i = 0; i != v4; ++i)
    *(_QWORD *)&v8[8 * i] = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", i);
LABEL_13:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", v8, v4);
  if (v4 >= 0x201)
    NSZoneFree(0, v8);
  objc_autoreleasePoolPop(v5);
  return v10;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t i;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[2];

  length = a4.length;
  location = a4.location;
  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = -[_PFMutableProxyArray count](self, "count");
  if (v8 < location + length)
    v8 = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), location + length - 1, v8);
  if (length)
  {
    v9 = (void *)MEMORY[0x18D76B4E4](v8);
    if (length >= 0x201)
      v10 = 1;
    else
      v10 = length;
    v11 = (8 * v10 + 15) & 0xFFFFFFFFFFFFFFF0;
    v12 = (char *)v17 - v11;
    if (length > 0x200)
      v12 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)v17 - v11, 8 * length);
    for (i = 0; i != length; ++i)
    {
      v14 = -[_PFMutableProxyArray objectAtIndex:](self, "objectAtIndex:", location + i);
      *(_QWORD *)&v12[8 * i] = v14;
      a3[i] = v14;
    }
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v12, length);
    if (length >= 0x201)
      NSZoneFree(0, v12);
    objc_autoreleasePoolPop(v9);
    v16 = v15;
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, -[_PFMutableProxyArray count](self, "count"));
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, -[_PFMutableProxyArray count](self, "count", a3, a4.location, a4.length));
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFMutableProxyArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, -[_PFMutableProxyArray count](self, "count"));
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  uint64_t (*v9)(id, char *, id);
  id v10;

  length = a4.length;
  location = a4.location;
  v7 = (id)objc_msgSend(a3, "objectID");
  v8 = objc_msgSend(v7, "methodForSelector:", sel_isEqual_);
  if (location >= location + length)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = (uint64_t (*)(id, char *, id))v8;
  while (1)
  {
    v10 = -[_PFMutableProxyArray managedObjectIDAtIndex:](self, "managedObjectIDAtIndex:", location);
    if (v7 == v10 || (v9(v7, sel_isEqual_, v10) & 1) != 0)
      break;
    ++location;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return location;
}

- (id)valueForKey:(id)a3
{
  id v5;
  uint64_t v6;
  objc_super v8;

  if (!objc_msgSend(a3, "isEqual:", CFSTR("objectID"))
    || (v5 = -[_PFMutableProxyArray arrayFromObjectIDs](self, "arrayFromObjectIDs"),
        v6 = objc_msgSend(v5, "count"),
        v6 != -[_PFMutableProxyArray count](self, "count")))
  {
    v8.receiver = self;
    v8.super_class = (Class)_PFMutableProxyArray;
    return -[_PFMutableProxyArray valueForKey:](&v8, sel_valueForKey_, a3);
  }
  return v5;
}

- (void)addObject:(id)a3
{
  int v5;

  v5 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a3);
  CFArrayAppendValue(self->_indicesVeneer, (const void *)(v5 & 0x7FFFFFFF | 0x80000000));
}

- (void)removeLastObject
{
  CFIndex Count;
  CFIndex v4;
  unsigned int ValueAtIndex;
  unsigned int editCount;

  Count = CFArrayGetCount(self->_indicesVeneer);
  if (Count)
  {
    v4 = Count;
    ValueAtIndex = CFArrayGetValueAtIndex(self->_indicesVeneer, Count - 1);
    if ((ValueAtIndex & 0x80000000) != 0)
    {
      -[NSMutableArray replaceObjectAtIndex:withObject:](self->_updatedObjectsArray, "replaceObjectAtIndex:withObject:", ValueAtIndex & 0x7FFFFFFF, NSKeyValueCoding_NullValue);
      editCount = self->_editCount;
      if (editCount)
        self->_editCount = editCount - 1;
    }
    CFArrayRemoveValueAtIndex(self->_indicesVeneer, v4);
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  int v7;

  v7 = -[NSMutableArray count](self->_updatedObjectsArray, "count");
  -[NSMutableArray addObject:](self->_updatedObjectsArray, "addObject:", a4);
  CFArraySetValueAtIndex(self->_indicesVeneer, a3, (const void *)(v7 & 0x7FFFFFFF | 0x80000000));
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
