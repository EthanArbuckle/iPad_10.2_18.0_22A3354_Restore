@implementation MFWeakSet

- (void)addObject:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  CFDictionaryAddValue(self->_objects, a3, +[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:", a3));
  ++self->_gen;
  -[NSLock unlock](self->_lock, "unlock");
}

- (MFWeakSet)init
{
  MFWeakSet *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MFWeakSet;
  v2 = -[MFWeakSet init](&v4, sel_init);
  if (v2)
  {
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v2->_objects = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  }
  return v2;
}

- (unint64_t)count
{
  CFIndex Count;

  -[NSLock lock](self->_lock, "lock");
  Count = CFDictionaryGetCount(self->_objects);
  -[NSLock unlock](self->_lock, "unlock");
  return Count;
}

- (id)member:(id)a3
{
  void *Value;
  void *v6;

  -[NSLock lock](self->_lock, "lock");
  Value = (void *)CFDictionaryGetValue(self->_objects, a3);
  if (Value)
  {
    v6 = (void *)objc_msgSend(Value, "retainedReference");
    if (!v6)
      CFDictionaryRemoveValue(self->_objects, a3);
  }
  else
  {
    v6 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v6;
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(-[MFWeakSet allObjects](self, "allObjects"), "objectEnumerator");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  id v9;
  uint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  CFRange v15;

  if (!a3->var0)
  {
    v9 = -[MFWeakSet allObjects](self, "allObjects");
    v10 = objc_msgSend(v9, "count");
    if (v10)
    {
      a3->var2 = &self->_gen;
      a3->var3[0] = v10;
      a3->var3[1] = (unint64_t)v9;
    }
  }
  v11 = a3->var3[0];
  v12 = v11 > a3->var0;
  v13 = v11 - a3->var0;
  if (!v12)
    return 0;
  if (v13 < a5)
    a5 = v13;
  if (a5)
  {
    v15.length = a5;
    v15.location = a3->var0;
    CFArrayGetValues((CFArrayRef)a3->var3[1], v15, (const void **)a4);
    a3->var0 += a5;
    a3->var1 = a4;
  }
  return a5;
}

- (id)_copyAllItems
{
  CFIndex Count;
  void *v4;
  const void **v5;
  const void **v6;
  uint64_t i;
  uint64_t v8;
  void *v9;

  -[NSLock lock](self->_lock, "lock");
  Count = CFDictionaryGetCount(self->_objects);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count)
  {
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_objects, v5, v6);
    for (i = 0; i != Count; ++i)
    {
      v8 = objc_msgSend((id)v6[i], "retainedReference");
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(v4, "addObject:", v8);

      }
      else
      {
        CFDictionaryRemoveValue(self->_objects, v5[i]);
      }
    }
    free(v6);
    free(v5);
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v4;
}

- (id)allObjects
{
  return -[MFWeakSet _copyAllItems](self, "_copyAllItems");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSet:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSet:", self);
}

- (id)anyObject
{
  CFIndex Count;
  CFIndex v4;
  size_t v5;
  const void **v6;
  const void **v7;
  uint64_t i;
  void *v9;

  -[NSLock lock](self->_lock, "lock");
  Count = CFDictionaryGetCount(self->_objects);
  if (Count)
  {
    v4 = Count;
    v5 = 8 * Count;
    v6 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v7 = (const void **)malloc_type_malloc(v5, 0x80040B8603338uLL);
    CFDictionaryGetKeysAndValues(self->_objects, v6, v7);
    for (i = 0; i != v4; ++i)
    {
      v9 = (void *)objc_msgSend((id)v7[i], "retainedReference");
      if (v9)
        break;
      CFDictionaryRemoveValue(self->_objects, v6[i]);
    }
    free(v7);
    free(v6);
  }
  else
  {
    v9 = 0;
  }
  -[NSLock unlock](self->_lock, "unlock");
  return v9;
}

- (BOOL)containsObject:(id)a3
{
  return -[MFWeakSet member:](self, "member:", a3) != 0;
}

- (id)description
{
  return -[MFWeakSet descriptionWithLocale:](self, "descriptionWithLocale:", 0);
}

- (id)descriptionWithLocale:(id)a3
{
  void *v4;
  objc_class *v5;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@> %p"), NSStringFromClass(v5), self);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = -[MFWeakSet _copyAllItems](self, "_copyAllItems");
  if (objc_msgSend(a3, "allowsKeyedCoding"))
    objc_msgSend(a3, "encodeObject:forKey:", v4, CFSTR("objects"));
  else
    objc_msgSend(a3, "encodeObject:", v4);

}

- (MFWeakSet)initWithCoder:(id)a3
{
  MFWeakSet *v4;
  uint64_t v5;
  void *v6;
  const __CFAllocator *v7;
  CFIndex v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFWeakSet;
  v4 = -[MFWeakSet initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if (objc_msgSend(a3, "allowsKeyedCoding"))
      v5 = objc_msgSend(a3, "decodeObjectForKey:", CFSTR("objects"));
    else
      v5 = objc_msgSend(a3, "decodeObject");
    v6 = (void *)v5;
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = objc_msgSend(v6, "count");
    v4->_objects = CFDictionaryCreateMutable(v7, v8, 0, MEMORY[0x1E0C9B3A0]);
    -[MFWeakSet addObjectsFromArray:](v4, "addObjectsFromArray:", v6);
  }
  return v4;
}

- (BOOL)intersectsSet:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
LABEL_12:
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(self);
        if ((objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)) & 1) != 0)
          goto LABEL_12;
        if (v6 == ++v8)
        {
          v6 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          LOBYTE(v5) = 0;
          if (v6)
            goto LABEL_5;
          return v5;
        }
      }
    }
  }
  return v5;
}

- (BOOL)isEqualToSet:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    LOBYTE(v6) = 1;
  }
  else
  {
    v5 = -[MFWeakSet count](self, "count");
    if (v5 == objc_msgSend(a3, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v12;
LABEL_5:
        v9 = 0;
        while (1)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(self);
          LODWORD(v6) = objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9));
          if (!(_DWORD)v6)
            break;
          if (v7 == ++v9)
          {
            v7 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
            LOBYTE(v6) = 1;
            if (v7)
              goto LABEL_5;
            return v6;
          }
        }
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)isSubsetOfSet:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 == self
    || (v13 = 0u,
        v14 = 0u,
        v11 = 0u,
        v12 = 0u,
        (v5 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16)) == 0))
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
LABEL_4:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(self);
      v9 = objc_msgSend(a3, "containsObject:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8));
      if (!v9)
        break;
      if (v6 == ++v8)
      {
        v6 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        LOBYTE(v9) = 1;
        if (v6)
          goto LABEL_4;
        return v9;
      }
    }
  }
  return v9;
}

- (void)makeObjectsPerformSelector:(SEL)a3
{
  -[MFWeakSet makeObjectsPerformSelector:withObject:](self, "makeObjectsPerformSelector:withObject:", a3, 0);
}

- (void)makeObjectsPerformSelector:(SEL)a3 withObject:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(self);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), a3, a4);
      }
      while (v8 != v10);
      v8 = -[MFWeakSet countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (id)setByAddingObject:(id)a3
{
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v4[0] = a3;
  return -[MFWeakSet setByAddingObjectsFromArray:](self, "setByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1));
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  return -[MFWeakSet setByAddingObjectsFromArray:](self, "setByAddingObjectsFromArray:", objc_msgSend(a3, "allObjects"));
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  id v4;
  void *v5;

  v4 = -[MFWeakSet _copyAllItems](self, "_copyAllItems");
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithArray:", objc_msgSend(v4, "arrayByAddingObjectsFromArray:", a3));

  return v5;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  -[MFWeakSet enumerateObjectsWithOptions:usingBlock:](self, "enumerateObjectsWithOptions:usingBlock:", 0, a3);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[MFWeakSet _copyAllItems](self, "_copyAllItems", a3);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      (*((void (**)(id, uint64_t, char *))a4 + 2))(a4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)objectsPassingTest:(id)a3
{
  return -[MFWeakSet objectsWithOptions:passingTest:](self, "objectsWithOptions:passingTest:", 0, a3);
}

- (id)objectsWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v7 = -[MFWeakSet _copyAllItems](self, "_copyAllItems");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
      v14 = 0;
      if ((*((unsigned int (**)(id, uint64_t, char *))a4 + 2))(a4, v12, &v14))
        objc_msgSend(v6, "addObject:", v12);
      if (v14)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  return v6;
}

+ (id)set
{
  return objc_alloc_init((Class)a1);
}

+ (MFWeakSet)setWithObject:(id)a3
{
  id v4;

  v4 = a3;
  return (MFWeakSet *)objc_msgSend(a1, "setWithObjects:count:", &v4, 1);
}

+ (MFWeakSet)setWithObjects:(const void *)a3 count:(unint64_t)a4
{
  return (MFWeakSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithObjects:count:", a3, a4);
}

+ (MFWeakSet)setWithObjects:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  MFWeakSet *v12;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;

  if (!a3)
    return (MFWeakSet *)objc_msgSend(a1, "set");
  LODWORD(v5) = 0;
  v14 = &v16;
  do
  {
    v6 = v14++;
    v5 = (v5 + 1);
  }
  while (*v6);
  if (!(_DWORD)v5)
    return (MFWeakSet *)objc_msgSend(a1, "set");
  v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  v8 = v7;
  *v7 = (uint64_t)a3;
  v15 = &v16;
  if ((_DWORD)v5 != 1)
  {
    v9 = v7 + 1;
    v10 = v5 - 1;
    do
    {
      v11 = v15++;
      *v9++ = *v11;
      --v10;
    }
    while (v10);
  }
  v12 = (MFWeakSet *)(id)objc_msgSend(objc_allocWithZone((Class)a1), "initWithObjects:count:", v7, v5);
  free(v8);
  return v12;
}

+ (MFWeakSet)setWithSet:(id)a3
{
  return (MFWeakSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSet:", a3);
}

+ (MFWeakSet)setWithArray:(id)a3
{
  return (MFWeakSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithArray:", a3);
}

+ (MFWeakSet)setWithCapacity:(unint64_t)a3
{
  return (MFWeakSet *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithCapacity:", a3);
}

- (MFWeakSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  void *v5;
  MFWeakSet *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", a3, a4);
  v6 = -[MFWeakSet initWithArray:](self, "initWithArray:", v5);

  return v6;
}

- (MFWeakSet)initWithObjects:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  MFWeakSet *v12;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;

  if (!a3)
    return -[MFWeakSet init](self, "init");
  LODWORD(v5) = 0;
  v14 = &v16;
  do
  {
    v6 = v14++;
    v5 = (v5 + 1);
  }
  while (*v6);
  if (!(_DWORD)v5)
    return -[MFWeakSet init](self, "init");
  v7 = (uint64_t *)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
  v8 = v7;
  *v7 = (uint64_t)a3;
  v15 = &v16;
  if ((_DWORD)v5 != 1)
  {
    v9 = v7 + 1;
    v10 = v5 - 1;
    do
    {
      v11 = v15++;
      *v9++ = *v11;
      --v10;
    }
    while (v10);
  }
  v12 = -[MFWeakSet initWithObjects:count:](self, "initWithObjects:count:", v7, v5);
  free(v8);
  return v12;
}

- (MFWeakSet)initWithSet:(id)a3
{
  return -[MFWeakSet initWithSet:copyItems:](self, "initWithSet:copyItems:", a3, 0);
}

- (MFWeakSet)initWithSet:(id)a3 copyItems:(BOOL)a4
{
  void *v6;
  void *v7;
  id v8;
  MFWeakSet *v9;

  v6 = (void *)objc_msgSend(a3, "allObjects");
  v7 = v6;
  if (a4)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v6, 1);
  else
    v8 = v6;
  v9 = -[MFWeakSet initWithArray:](self, "initWithArray:", v7);

  return v9;
}

- (MFWeakSet)initWithArray:(id)a3
{
  MFWeakSet *v4;
  MFWeakSet *v5;

  v4 = -[MFWeakSet initWithCapacity:](self, "initWithCapacity:", objc_msgSend(a3, "count"));
  v5 = v4;
  if (v4)
    -[MFWeakSet addObjectsFromArray:](v4, "addObjectsFromArray:", a3);
  return v5;
}

- (MFWeakSet)initWithCapacity:(unint64_t)a3
{
  MFWeakSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFWeakSet;
  v4 = -[MFWeakSet init](&v6, sel_init);
  if (v4)
  {
    v4->_lock = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    v4->_objects = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3, 0, MEMORY[0x1E0C9B3A0]);
  }
  return v4;
}

- (void)dealloc
{
  __CFDictionary *objects;
  objc_super v4;

  objects = self->_objects;
  if (objects)
    CFRelease(objects);
  v4.receiver = self;
  v4.super_class = (Class)MFWeakSet;
  -[MFWeakSet dealloc](&v4, sel_dealloc);
}

- (void)removeObject:(id)a3
{
  -[NSLock lock](self->_lock, "lock");
  CFDictionaryRemoveValue(self->_objects, a3);
  ++self->_gen;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSLock lock](self->_lock, "lock");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(a3);
        CFDictionaryAddValue(self->_objects, *(const void **)(*((_QWORD *)&v9 + 1) + 8 * v8), +[MFWeakReferenceHolder weakReferenceWithObject:](MFWeakReferenceHolder, "weakReferenceWithObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8)));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
  ++self->_gen;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)intersectSet:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    v5 = -[MFWeakSet _copyAllItems](self, "_copyAllItems");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_msgSend(a3, "containsObject:", v10) & 1) == 0)
            -[MFWeakSet removeObject:](self, "removeObject:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)minusSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 == self)
  {
    objc_msgSend(a3, "removeAllObjects");
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(a3);
          -[MFWeakSet removeObject:](self, "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        }
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)removeAllObjects
{
  -[NSLock lock](self->_lock, "lock");
  CFDictionaryRemoveAllValues(self->_objects);
  ++self->_gen;
  -[NSLock unlock](self->_lock, "unlock");
}

- (void)unionSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(a3);
          -[MFWeakSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

- (void)setSet:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3 != self)
  {
    -[MFWeakSet removeAllObjects](self, "removeAllObjects");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(a3);
          -[MFWeakSet addObject:](self, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }
  }
}

@end
