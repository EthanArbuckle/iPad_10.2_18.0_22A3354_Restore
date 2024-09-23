@implementation _PFArray

- (void)dealloc
{
  char flags;
  unint64_t v4;
  id *array;
  _PFWeakReference *weakContext;
  id WeakRetained;
  void *v8;
  objc_super v9;

  flags = (char)self->_flags;
  if (self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 6) != 0)
    {
      v4 = 0;
      do

      while (v4 < self->_count);
      flags = (char)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      array = self->_array;
LABEL_10:
      PF_FREE_OBJECT_ARRAY(array);
    }
  }
  else if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    array = self->_array;
    if (array)
      goto LABEL_10;
  }
  if (self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    {
      weakContext = self->_weakContext;
      if (weakContext)
      {
        WeakRetained = objc_loadWeakRetained(&weakContext->_object);
        if (WeakRetained)
        {
          v8 = WeakRetained;
          -[NSManagedObjectContext _registerAsyncReferenceCallback]((uint64_t)WeakRetained);

        }
      }
    }
  }

  self->_weakContext = 0;
  v9.receiver = self;
  v9.super_class = (Class)_PFArray;
  -[_PFArray dealloc](&v9, sel_dealloc);
}

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5 andContext:(id)a6
{
  char v7;
  char *v10;
  _PFArray *v11;
  _BYTE *v12;
  char v13;
  uint64_t v14;
  id v15;
  objc_super v17;

  v7 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_PFArray;
  v10 = -[_PFArray init](&v17, sel_init);
  v11 = (_PFArray *)v10;
  if (v10)
  {
    *((_DWORD *)v10 + 3) = a4;
    v12 = v10 + 32;
    v13 = v10[32] & 0xF0 | v7 & 0xB | 0x10;
    if ((v7 & 0x10) == 0)
      v13 = v10[32] & 0xE0 | v7 & 0xB;
    if ((v7 & 0x20) != 0)
    {
      *v12 = v13 | 0x20;
      if (a6
        && _PF_shouldAsyncProcessReferenceQueue
        && (objc_msgSend(a6, "concurrencyType") == 1 || objc_msgSend(a6, "concurrencyType") == 2))
      {
        v11->_weakContext = -[_PFWeakReference initWithObject:]([_PFWeakReference alloc], "initWithObject:", a6);
      }
    }
    else
    {
      *v12 = v13 & 0xDB;
    }
    *((_DWORD *)&v11->_flags + 1) &= 0xF8000000;
    if (a4)
    {
      if ((*v12 & 0x10) != 0)
      {
        v11->_array = (id *)PF_ALLOCATE_OBJECT_ARRAY(a4);
        *v12 |= 8u;
        memmove(v11->_array, a3, 8 * a4);
      }
      else
      {
        v11->_array = a3;
      }
      if ((*v12 & 1) != 0)
      {
        v14 = 0;
        do
          v15 = v11->_array[v14++];
        while (a4 != v14);
      }
    }
  }
  return v11;
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
          -[_PFArray dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (_PFArray)retain
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

- (unint64_t)count
{
  return self->_count;
}

- (id)newArrayFromObjectIDs
{
  uint64_t count;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t i;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    return (id)-[_PFArray copy](self, "copy");
  count = self->_count;
  if ((_DWORD)count)
    v5 = self->_count;
  else
    v5 = 1;
  if (count >= 0x201)
    v6 = 1;
  else
    v6 = v5;
  v7 = (char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0);
  if (count >= 0x201)
  {
    v7 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v10 - ((8 * v6 + 15) & 0xFFFFFFFF0), 8 * v5);
    if (!(_DWORD)count)
      goto LABEL_15;
  }
  for (i = 0; i != count; ++i)
    *(_QWORD *)&v7[8 * i] = objc_msgSend(self->_array[i], "objectID");
LABEL_15:
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v7, count);
  if (count >= 0x201)
    NSZoneFree(0, v7);
  return v9;
}

- (id)objectAtIndex:(unint64_t)a3
{
  if (self->_count > a3)
    return self->_array[a3];
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), a3, self->_count);
  return 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v6;
  unint64_t count;

  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = (unint64_t *)&self->_count;
  v6 = 0;
  a3->var1 = a4;
  if (a5)
  {
    count = self->_count;
    if (var0 < count)
    {
      v6 = 0;
      do
        a4[v6] = (id)*((_QWORD *)&self->_array[var0] + v6);
      while (++v6 + var0 < count && v6 < a5);
      var0 += v6;
    }
  }
  a3->var0 = var0;
  return v6;
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a4.length;
  location = a4.location;
  if (a4.location + a4.length > self->_count)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99858], CFSTR("%@: index (%lu) beyond bounds (%lu)"), _NSMethodExceptionProem(), a4.location + a4.length - 1, self->_count);
  if (length)
    memmove(a3, &self->_array[location], 8 * length);
}

- (_PFArray)initWithObjects:(id *)a3 count:(unsigned int)a4 andFlags:(unsigned int)a5
{
  return -[_PFArray initWithObjects:count:andFlags:andContext:](self, "initWithObjects:count:andFlags:andContext:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", self->_array, self->_count);
}

- (unint64_t)indexOfObject:(id)a3 inRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  uint64_t v9;
  uint64_t (*v10)(id, char *);

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  length = a4.length;
  location = a4.location;
  v8 = a4.location + a4.length;
  v9 = objc_msgSend(a3, "methodForSelector:", sel_isEqual_);
  if (location >= v8)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = (uint64_t (*)(id, char *))v9;
  while (self->_array[location] != a3 && (v10(a3, sel_isEqual_) & 1) == 0)
  {
    ++location;
    if (!--length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return location;
}

- (unint64_t)indexOfManagedObjectForObjectID:(id)a3
{
  uint64_t v5;
  uint64_t count;
  uint64_t (*v7)(id, char *);
  unint64_t v8;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = objc_msgSend(a3, "methodForSelector:", sel_isEqual_);
  count = self->_count;
  if (!(_DWORD)count)
    return 0x7FFFFFFFFFFFFFFFLL;
  v7 = (uint64_t (*)(id, char *))v5;
  v8 = 0;
  while (*((id *)self->_array[v8] + 5) != a3 && (v7(a3, sel_isEqual_) & 1) == 0)
  {
    if (count == ++v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v8;
}

- (id)managedObjectIDAtIndex:(unint64_t)a3
{
  id *v3;

  v3 = (id *)self->_array[a3];
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return v3[5];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return v3;
  else
    return 0;
}

- (id)arrayFromObjectIDs
{
  return -[_PFArray newArrayFromObjectIDs](self, "newArrayFromObjectIDs");
}

- (id)_objectsPointer
{
  return self->_array;
}

+ (void)initialize
{
  objc_opt_self();
}

- (void)getObjects:(id *)a3
{
  memmove(a3, self->_array, 8 * self->_count);
}

- (id)subarrayWithRange:(_NSRange)a3
{
  uint64_t v4;
  objc_super v5;

  if (a3.location + a3.length <= self->_count)
  {
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      v4 = 59;
    else
      v4 = 27;
    return -[_PFArray initWithObjects:count:andFlags:]([_PFArray alloc], "initWithObjects:count:andFlags:", &self->_array[a3.location], a3.length, v4);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_PFArray;
    return -[_PFArray subarrayWithRange:](&v5, sel_subarrayWithRange_, a3.location, a3.length);
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  uint64_t count;

  count = self->_count;
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, count);
  else
    return -[_PFArray indexOfObject:inRange:](self, "indexOfObject:inRange:", a3, 0, count);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

- (_PFArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return -[_PFArray initWithObjects:count:andFlags:](self, "initWithObjects:count:andFlags:", a3, a4, 27);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  return -[_PFArray indexOfObjectIdenticalTo:inRange:](self, "indexOfObjectIdenticalTo:inRange:", a3, 0, self->_count);
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3 inRange:(_NSRange)a4
{
  if (!a3 || a4.location >= a4.location + a4.length)
    return 0x7FFFFFFFFFFFFFFFLL;
  while (self->_array[a4.location] != a3)
  {
    ++a4.location;
    if (!--a4.length)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return a4.location;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:count:", self->_array, self->_count);
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

@end
