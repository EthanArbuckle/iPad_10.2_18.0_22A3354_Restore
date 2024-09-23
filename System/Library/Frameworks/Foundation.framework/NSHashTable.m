@implementation NSHashTable

+ (NSHashTable)alloc
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_self();
  return (NSHashTable *)NSAllocateObject(v2, 0, 0);
}

- (BOOL)containsObject:(id)anObject
{
  return -[NSHashTable getItem:](self, "getItem:", anObject) != 0;
}

- (void)unionHashTable:(NSHashTable *)other
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (other != self)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(other);
          -[NSHashTable addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }
  }
}

- (void)minusHashTable:(NSHashTable *)other
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (other == self)
  {
    -[NSHashTable removeAllObjects](other, "removeAllObjects");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(other);
          -[NSHashTable removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        }
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](other, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
      }
      while (v6);
    }
  }
}

+ (NSHashTable)weakObjectsHashTable
{
  return (NSHashTable *)-[NSConcreteHashTable initWithOptions:capacity:]([NSConcreteHashTable alloc], "initWithOptions:capacity:", 5, 0);
}

- (id)anyObject
{
  id result;
  uint64_t v3;
  _OWORD v4[4];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  memset(v4, 0, sizeof(v4));
  result = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", v4, &v3, 16);
  if (result)
    return (id)**((_QWORD **)&v4[0] + 1);
  return result;
}

+ (NSHashTable)hashTableWithOptions:(NSPointerFunctionsOptions)options
{
  return (NSHashTable *)-[NSConcreteHashTable initWithOptions:capacity:]([NSConcreteHashTable alloc], "initWithOptions:capacity:", options, 0);
}

+ (NSHashTable)allocWithZone:(_NSZone *)a3
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_self();
  return (NSHashTable *)NSAllocateObject(v3, 0, 0);
}

- (NSSet)setRepresentation
{
  NSSet *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (NSSet *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(self);
        -[NSSet addObject:](v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

+ (id)hashTableWithWeakObjects
{
  return -[NSConcreteHashTable initWithOptions:capacity:]([NSConcreteHashTable alloc], "initWithOptions:capacity:", 1, 0);
}

- (NSHashTable)initWithCoder:(id)a3
{

  return (NSHashTable *)-[NSConcreteHashTable initWithCoder:]([NSConcreteHashTable alloc], "initWithCoder:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (Class)classForCoder
{
  return (Class)objc_opt_self();
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (NSHashTable)initWithOptions:(NSPointerFunctionsOptions)options capacity:(NSUInteger)initialCapacity
{
  raiseError((uint64_t)self, a2);
}

- (NSHashTable)init
{
  raiseError((uint64_t)self, a2);
}

- (id)description
{
  raiseError((uint64_t)self, a2);
}

- (NSEnumerator)objectEnumerator
{
  raiseError((uint64_t)self, a2);
}

- (void)encodeWithCoder:(id)a3
{
  raiseError((uint64_t)self, a2);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  raiseError((uint64_t)self, a2);
}

- (NSUInteger)count
{
  raiseError((uint64_t)self, a2);
}

- (NSArray)allObjects
{
  raiseError((uint64_t)self, a2);
}

- (void)getItem:(const void *)a3
{
  raiseError((uint64_t)self, a2);
}

- (void)addObject:(id)object
{
  raiseError((uint64_t)self, a2);
}

- (void)insertKnownAbsentItem:(const void *)a3
{
  raiseError((uint64_t)self, a2);
}

- (void)removeItem:(const void *)a3
{
  raiseError((uint64_t)self, a2);
}

- (id)copy
{
  raiseError((uint64_t)self, a2);
}

- (void)removeAllItems
{
  raiseError((uint64_t)self, a2);
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  raiseError((uint64_t)self, a2);
}

- (NSHashTable)initWithPointerFunctions:(NSPointerFunctions *)functions capacity:(NSUInteger)initialCapacity
{
  raiseError((uint64_t)self, a2);
}

- (NSPointerFunctions)pointerFunctions
{
  raiseError((uint64_t)self, a2);
}

- (BOOL)intersectsHashTable:(NSHashTable *)other
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(self);
        if (-[NSHashTable member:](other, "member:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8)))
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (BOOL)isEqualToHashTable:(NSHashTable *)other
{
  NSUInteger v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (other == self)
    goto LABEL_12;
  v5 = -[NSHashTable count](other, "count");
  if (v5 != -[NSHashTable count](self, "count"))
  {
    LOBYTE(v10) = 0;
    return (char)v10;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (!v6)
  {
LABEL_12:
    LOBYTE(v10) = 1;
  }
  else
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(self);
      v10 = -[NSHashTable member:](other, "member:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
      if (!v10)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
        LOBYTE(v10) = 1;
        if (v7)
          goto LABEL_5;
        return (char)v10;
      }
    }
  }
  return (char)v10;
}

- (BOOL)isSubsetOfHashTable:(NSHashTable *)other
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(self);
      v9 = -[NSHashTable member:](other, "member:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
      if (!v9)
        break;
      if (v6 == ++v8)
      {
        v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    LOBYTE(v9) = 1;
  }
  return (char)v9;
}

- (void)intersectHashTable:(NSHashTable *)other
{
  NSUInteger v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  CFStringRef v15;
  void *v16;
  _QWORD v17[2];
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = -[NSHashTable count](self, "count");
  if (v5 >> 60)
  {
    v15 = CFStringCreateWithFormat(0, 0, CFSTR("*** attempt to create a temporary id buffer which is too large or with a negative count (%lu) -- possibly data is corrupt"), v5);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], v15, 0);
    CFRelease(v15);
    objc_exception_throw(v16);
  }
  if (v5 <= 1)
    v5 = 1;
  MEMORY[0x1E0C80A78](v5);
  v7 = (_QWORD *)((char *)v17 - v6);
  v17[1] = 0;
  if (v8 >= 0x101)
  {
    v7 = (uint64_t *)_CFCreateArrayStorage();
    v9 = v7;
  }
  else
  {
    v9 = 0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  v11 = v7;
  if (v10)
  {
    v12 = *(_QWORD *)v20;
    v11 = v7;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(self);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (!-[NSHashTable member:](other, "member:", v14))
          *v11++ = v14;
      }
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v10);
  }
  while (v7 < v11)
    -[NSHashTable removeObject:](self, "removeObject:", *v7++);
  free(v9);
}

- (id)mutableSet
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(self);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

@end
