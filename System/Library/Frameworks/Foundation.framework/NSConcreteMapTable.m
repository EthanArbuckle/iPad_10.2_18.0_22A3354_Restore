@implementation NSConcreteMapTable

- (id)copy
{
  NSConcreteMapTable *v3;
  NSConcreteMapTable *v4;
  uint64_t *p_keys;
  NSSlice *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;

  v3 = [NSConcreteMapTable alloc];
  v4 = v3;
  v3->count = 0;
  v3->capacity = self->capacity;
  v3->keyOptions = self->keyOptions;
  v3->valueOptions = self->valueOptions;
  v3->mutations = 0;
  p_keys = (uint64_t *)&v3->keys;
  v6 = &self->keys;
  if (self->hasDynamicSlices)
  {
    NSSliceInitWithSlice(&v3->keys.items, &self->keys.items);
    NSSliceInitWithSlice(&v4->values.items, &self->values.items);
    v4->hasDynamicSlices = 1;
  }
  else
  {
    v7 = *(_OWORD *)&self->keys.personalityProps;
    *(_OWORD *)p_keys = *(_OWORD *)&v6->items;
    *(_OWORD *)&v3->keys.personalityProps = v7;
    v8 = *(_OWORD *)&self->values.personalityProps;
    *(_OWORD *)&v3->values.items = *(_OWORD *)&self->values.items;
    *(_OWORD *)&v3->values.personalityProps = v8;
  }
  allocateInitialCapacity_0(p_keys, self->capacity);
  allocateInitialCapacity_0((uint64_t *)&v4->values, self->capacity);
  if (self->capacity)
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = (*((uint64_t (**)(void **, _QWORD))self->keys.internalProps + 3))(&v6->items[v9], 0);
      v12 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v9], 0);
      if (v11 | v12)
      {
        v13 = v12;
        if (v12)
          v14 = v11 != 0;
        else
          v14 = 1;
        if (v12)
          v15 = 1;
        else
          v15 = v11 == 0;
        if (v15 && v14)
          -[NSConcreteMapTable setObject:forKey:](v4, "setObject:forKey:", v12, v11);
        else
          self->shouldRehash = 1;
        (*((void (**)(uint64_t))self->keys.internalProps + 4))(v11);
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
      }
      ++v10;
      ++v9;
    }
    while (v10 < self->capacity);
  }
  if (self->shouldRehash)
    -[NSConcreteMapTable rehash](self, "rehash");
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v9 = 0;
      v7 = probeGC(self, (unint64_t)a4, &v9, 0, 1);
      -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, v9 == 0);
      if (!v9)
      {
        v8 = self->count + 1;
        self->count = v8;
        if (self->capacity < 2 * v8)
          -[NSConcreteMapTable grow](self, "grow");
      }
    }
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v4;
  NSSlice *p_values;
  void *v6;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v8 = 0;
  v4 = probeGC(self, (unint64_t)a3, &v8, 0, 0);
  if (!v8)
    return 0;
  p_values = &self->values;
  v6 = (void *)(*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v4], 0);
  (*((void (**)(void))p_values->internalProps + 5))();
  return v6;
}

- (void)assign:(unint64_t)a3 key:(const void *)a4 value:(const void *)a5 isNew:(BOOL)a6
{
  NSSlice *p_keys;
  NSSliceExternalAcquisitionProperties *acquisitionProps;
  uint64_t (*v12)(const void *, _QWORD, _QWORD);
  NSSlice *p_values;
  NSSliceExternalAcquisitionProperties *v14;
  uint64_t (*v15)(const void *, _QWORD, _QWORD, const void *);
  uint64_t v16;

  ++self->mutations;
  if (a6)
  {
    p_keys = &self->keys;
    acquisitionProps = self->keys.acquisitionProps;
    v12 = (uint64_t (*)(const void *, _QWORD, _QWORD))*((_QWORD *)acquisitionProps + 1);
    if (v12)
      a4 = (const void *)v12(a4, *((_QWORD *)self->keys.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
    (*((void (**)(void **, unint64_t, const void *))self->keys.internalProps + 7))(p_keys->items, a3, a4);
  }
  p_values = &self->values;
  v14 = p_values->acquisitionProps;
  v15 = (uint64_t (*)(const void *, _QWORD, _QWORD, const void *))*((_QWORD *)v14 + 1);
  if (v15)
    a5 = (const void *)v15(a5, *((_QWORD *)p_values->personalityProps + 1), *((unsigned __int8 *)v14 + 4), a4);
  if (!a6)
  {
    if (*((_QWORD *)p_values->acquisitionProps + 2))
    {
      v16 = (*((uint64_t (**)(void **, _QWORD, unint64_t, const void *))p_values->internalProps + 3))(&p_values->items[a3], 0, a3, a4);
      (*((void (**)(uint64_t, _QWORD))p_values->acquisitionProps + 2))(v16, *((_QWORD *)p_values->personalityProps + 1));
      (*((void (**)(uint64_t))p_values->internalProps + 4))(v16);
    }
    (*((void (**)(void **, SEL, unint64_t, const void *))p_values->internalProps + 6))(&p_values->items[a3], a2, a3, a4);
  }
  (*((void (**)(void **, unint64_t, const void *))p_values->internalProps + 7))(p_values->items, a3, a5);
}

- (unint64_t)getKeys:(const void *)a3 values:(const void *)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSSlice *p_keys;
  const void *v9;
  const void *v10;
  BOOL v11;
  const void **v12;

  if (self->capacity)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    p_keys = &self->keys;
    do
    {
      v9 = (const void *)(*((uint64_t (**)(void **, _QWORD))p_keys->internalProps + 3))(&p_keys->items[v5], 0);
      v10 = (const void *)(*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v5], 0);
      (*((void (**)(const void *))p_keys->internalProps + 5))(v9);
      (*((void (**)(const void *))self->values.internalProps + 5))(v10);
      if (v9)
        v11 = v10 == 0;
      else
        v11 = 1;
      if (!v11)
      {
        a3[v7] = v9;
        a4[v7++] = v10;
      }
      ++v6;
      ++v5;
    }
    while (v6 < self->capacity);
  }
  else
  {
    v7 = 0;
  }
  v12 = &a3[v7];
  if (v12 != a4)
    memmove(v12, a4, 8 * v7);
  return v7;
}

- (void)grow
{
  NSConcreteMapTable *v2;
  NSSlice *p_keys;
  NSSlice *p_values;
  unint64_t capacity;
  unint64_t v6;
  uint64_t v7;
  void **v8;
  uint64_t v9;
  void **v10;
  void **v11;
  void **v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(unint64_t, _QWORD);
  void (*v25)(uint64_t, _QWORD);
  void **items;
  void **v27;
  NSConcreteMapTable *v28;

  v2 = self;
  p_keys = &self->keys;
  p_values = &self->values;
  items = self->keys.items;
  v27 = self->values.items;
  capacity = self->capacity;
  if (!self->shouldRehash || (-[NSConcreteMapTable rehash](self, "rehash"), v2->capacity <= 2 * v2->count))
  {
    v6 = capacity << (v2->capacity <= 2 * NSConcreteMapTable_reclaim((uint64_t)v2));
    v7 = (*((uint64_t (**)(unint64_t))p_keys->internalProps + 1))(v6);
    if (!v7
      || (v8 = (void **)v7, (v9 = (*((uint64_t (**)(unint64_t))p_values->internalProps + 1))(v6)) == 0))
    {
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("*** NSMapTable unable to allocate memory -- allocation function failed"), 0, items));
    }
    v10 = (void **)v9;
    os_unfair_lock_lock(&v2->growLock);
    p_keys->items = v8;
    p_values->items = v10;
    v2->capacity = v6;
    os_unfair_lock_unlock(&v2->growLock);
    v2->count = 0;
    if (capacity)
    {
      v11 = items;
      v12 = v27;
      v13 = capacity;
      v28 = v2;
      do
      {
        v14 = (void *)MEMORY[0x186DA8F78]();
        v15 = (*((uint64_t (**)(void **, _QWORD))p_keys->internalProps + 3))(v11, 0);
        v16 = (*((uint64_t (**)(void **, _QWORD))p_values->internalProps + 3))(v12, 0);
        if (v15 | v16)
        {
          v17 = v16;
          if (v15)
            v18 = v16 == 0;
          else
            v18 = 0;
          if (v18)
          {
            v24 = (void (*)(unint64_t, _QWORD))*((_QWORD *)p_keys->acquisitionProps + 2);
            if (v24)
              v24(v15, *((_QWORD *)p_keys->personalityProps + 1));
            (*((void (**)(void **))p_keys->internalProps + 6))(v11);
            (*((void (**)(unint64_t))p_keys->internalProps + 4))(v15);
          }
          else
          {
            if (v15)
              v19 = 1;
            else
              v19 = v16 == 0;
            if (v19)
            {
              v20 = probeGC(v2, v15, 0, 0, 1);
              v21 = capacity;
              v22 = v20;
              (*((void (**)(void **, uint64_t, unint64_t))p_keys->internalProps + 7))(p_keys->items, v20, v15);
              v23 = v22;
              capacity = v21;
              v2 = v28;
              (*((void (**)(void **, uint64_t, uint64_t))p_values->internalProps + 7))(p_values->items, v23, v17);
              (*((void (**)(unint64_t))p_keys->internalProps + 4))(v15);
              (*((void (**)(uint64_t))p_values->internalProps + 4))(v17);
              ++v28->count;
            }
            else
            {
              v25 = (void (*)(uint64_t, _QWORD))*((_QWORD *)p_values->acquisitionProps + 2);
              if (v25)
                v25(v16, *((_QWORD *)p_keys->personalityProps + 1));
              (*((void (**)(void **))p_values->internalProps + 6))(v12);
              (*((void (**)(uint64_t))p_values->internalProps + 4))(v17);
            }
          }
        }
        objc_autoreleasePoolPop(v14);
        ++v12;
        ++v11;
        --v13;
      }
      while (v13);
    }
    (*((void (**)(void **, unint64_t))p_keys->internalProps + 2))(items, capacity);
    (*((void (**)(void **, unint64_t))p_values->internalProps + 2))(v27, capacity);
  }
}

- (id)objectEnumerator
{
  return +[NSConcreteMapTableValueEnumerator enumeratorWithMapTable:](NSConcreteMapTableValueEnumerator, "enumeratorWithMapTable:", self);
}

- (void)dealloc
{
  NSSlice *p_keys;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  p_keys = &self->keys;
  dealloc((uint64_t)&self->keys, self->capacity);
  dealloc((uint64_t)&self->values, self->capacity);
  if (self->hasDynamicSlices)
  {
    NSSliceDealloc((void **)&p_keys->items);
    NSSliceDealloc((void **)&self->values.items);
  }
  v4.receiver = self;
  v4.super_class = (Class)NSConcreteMapTable;
  -[NSConcreteMapTable dealloc](&v4, sel_dealloc);
}

- (unint64_t)count
{
  unint64_t result;

  if (!self->shouldRehash)
    return self->count;
  -[NSConcreteMapTable rehash](self, "rehash");
  result = -[NSConcreteMapTable realCount](self, "realCount");
  self->count = result;
  return result;
}

- (NSConcreteMapTable)initWithKeyOptions:(unint64_t)a3 valueOptions:(unint64_t)a4 capacity:(unint64_t)a5
{
  unint64_t v7;
  char v8;
  unsigned int v10;
  NSString *v12;

  if (a5 >= 5)
  {
    if ((a5 & (a5 - 1)) != 0)
    {
      v7 = 0;
      do
      {
        v8 = v7 + 1;
        if (a5 < 2)
          break;
        a5 >>= 1;
      }
      while (v7++ < 0x17);
      v10 = 1 << v8;
      if (v10 <= 4)
        a5 = 4;
      else
        a5 = v10;
    }
  }
  else
  {
    a5 = 4;
  }
  self->capacity = a5;
  self->keyOptions = a3;
  self->valueOptions = a4;
  self->count = 0;
  self->mutations = 0;
  self->growLock._os_unfair_lock_opaque = 0;
  if (!+[NSConcretePointerFunctions initializeSlice:withOptions:](NSConcretePointerFunctions, "initializeSlice:withOptions:", &self->keys, self->keyOptions)|| !+[NSConcretePointerFunctions initializeSlice:withOptions:](NSConcretePointerFunctions, "initializeSlice:withOptions:", &self->values, self->valueOptions))
  {
    v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSMapTable %@] Requested configuration not supported."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v12, 0));
  }
  -[NSConcreteMapTable _setBackingStore](self, "_setBackingStore");
  allocateInitialCapacity_0((uint64_t *)&self->keys, self->capacity);
  allocateInitialCapacity_0((uint64_t *)&self->values, self->capacity);
  return self;
}

- (void)_setBackingStore
{
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:");
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:");
}

- (unint64_t)realCount
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSSlice *p_keys;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;

  if (!self->capacity)
    return 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  p_keys = &self->keys;
  do
  {
    v7 = (*((uint64_t (**)(void **, _QWORD))p_keys->internalProps + 3))(&p_keys->items[v3], 0);
    v8 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v3], 0);
    v9 = v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
      ++v5;
    (*((void (**)(uint64_t))p_keys->internalProps + 4))(v7);
    (*((void (**)(uint64_t))self->values.internalProps + 4))(v9);
    ++v4;
    ++v3;
  }
  while (v4 < self->capacity);
  return v5;
}

- (id)allKeys
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (self->capacity)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (*((uint64_t (**)(void **, _QWORD))self->keys.internalProps + 3))(&self->keys.items[v4], 0);
      v7 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v4], 0);
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (!v9)
        objc_msgSend(v3, "addObject:", v6);
      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v6);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      ++v5;
      ++v4;
    }
    while (v5 < self->capacity);
  }
  return v3;
}

- (id)allValues
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (self->capacity)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (*((uint64_t (**)(void **, _QWORD))self->keys.internalProps + 3))(&self->keys.items[v4], 0);
      v7 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v4], 0);
      v8 = v7;
      if (v6)
        v9 = v7 == 0;
      else
        v9 = 1;
      if (!v9)
        objc_msgSend(v3, "addObject:", v7);
      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v6);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      ++v5;
      ++v4;
    }
    while (v5 < self->capacity);
  }
  return v3;
}

- (void)removeAllItems
{
  ++self->mutations;
  empty_0((uint64_t)&self->keys, self->capacity);
  empty_0((uint64_t)&self->values, self->capacity);
  self->count = 0;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t *p_mutations;
  unint64_t var0;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  unint64_t *v12;

  p_mutations = &self->mutations;
  a3->var2 = &self->mutations;
  if (a3->var0)
  {
    if (a3->var3[0] == *p_mutations)
    {
      (*((void (**)(unint64_t, SEL))self->keys.internalProps + 4))(a3->var3[1], a2);
      (*((void (**)(unint64_t))self->values.internalProps + 4))(a3->var3[2]);
    }
    else
    {
      objc_enumerationMutation(self);
    }
  }
  else
  {
    a3->var3[0] = *p_mutations;
  }
  var0 = a3->var0;
  while (var0 < self->capacity)
  {
    v9 = (*((uint64_t (**)(void **, _QWORD))self->keys.internalProps + 3))(&self->keys.items[var0], 0);
    v10 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[a3->var0], 0);
    var0 = a3->var0 + 1;
    a3->var0 = var0;
    if (v9)
      v11 = v10 == 0;
    else
      v11 = 1;
    if (!v11)
    {
      a3->var3[1] = v9;
      v12 = &a3->var3[1];
      *(v12 - 3) = (unint64_t)v12;
      v12[1] = v10;
      return 1;
    }
  }
  return 0;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99EA8]), "initWithObject:", self);
}

- (NSConcreteMapTable)initWithKeyPointerFunctions:(id)a3 valuePointerFunctions:(id)a4 capacity:(unint64_t)a5
{
  unint64_t v8;
  char v9;
  unsigned int v11;
  NSString *v13;

  if (!a3 || !a4)
  {
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSMapTable %@] Requested configuration not supported."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v13, 0));
  }
  NSSliceInitWithSlice(&self->keys.items, (_QWORD *)a3 + 1);
  NSSliceInitWithSlice(&self->values.items, (_QWORD *)a4 + 1);
  self->hasDynamicSlices = 1;
  if (a5 >= 5)
  {
    if ((a5 & (a5 - 1)) != 0)
    {
      v8 = 0;
      do
      {
        v9 = v8 + 1;
        if (a5 < 2)
          break;
        a5 >>= 1;
      }
      while (v8++ < 0x17);
      v11 = 1 << v9;
      if (v11 <= 4)
        a5 = 4;
      else
        a5 = v11;
    }
  }
  else
  {
    a5 = 4;
  }
  self->capacity = a5;
  self->count = 0;
  self->mutations = 0;
  self->keyOptions = 0x20000;
  self->valueOptions = 0x20000;
  self->growLock._os_unfair_lock_opaque = 0;
  -[NSConcreteMapTable _setBackingStore](self, "_setBackingStore");
  allocateInitialCapacity_0((uint64_t *)&self->keys, self->capacity);
  allocateInitialCapacity_0((uint64_t *)&self->values, self->capacity);
  return self;
}

- (void)rehash
{
  unint64_t capacity;
  unint64_t v4;
  NSSlice *p_keys;
  void *v6;
  unint64_t v7;

  capacity = self->capacity;
  if (capacity)
  {
    v4 = 0;
    p_keys = &self->keys;
    v6 = (void *)*((unsigned __int8 *)self->keys.internalProps + 3);
    do
    {
      if (p_keys->items[v4] == v6)
      {
        ++v4;
      }
      else
      {
        v7 = -[NSConcreteMapTable rehashAround:](self, "rehashAround:", v4);
        if (v7 < v4)
          break;
        capacity = self->capacity;
        v4 = v7;
      }
    }
    while (v4 < capacity);
  }
  self->shouldRehash = 0;
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD);
  NSSlice *p_values;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v10 = 0;
    v9 = 0;
    v4 = probeGC(self, (unint64_t)a3, &v10, &v9, 1);
    if (v10)
    {
      v5 = v4;
      v6 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->keys.acquisitionProps + 2);
      if (v6)
        v6(v9, *((_QWORD *)self->keys.personalityProps + 1));
      p_values = &self->values;
      if (*((_QWORD *)self->values.acquisitionProps + 2))
      {
        v8 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&p_values->items[v5], 0);
        (*((void (**)(uint64_t, _QWORD))self->values.acquisitionProps + 2))(v8, *((_QWORD *)self->values.personalityProps + 1));
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v8);
      }
      (*((void (**)(void **))self->keys.internalProps + 6))(&self->keys.items[v5]);
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v5]);
      --self->count;
      ++self->mutations;
      -[NSConcreteMapTable rehashAround:](self, "rehashAround:", v5);
    }
  }
}

- (unint64_t)rehashAround:(unint64_t)a3
{
  NSSlice *p_keys;
  NSSliceInternalProperties *internalProps;
  unint64_t capacity;
  void **items;
  unint64_t v9;
  unint64_t v10;
  NSSlice *p_values;
  uint64_t v12;
  uint64_t v13;
  BOOL v15;
  void (*v16)(unint64_t, _QWORD);
  void (*v17)(uint64_t, _QWORD);
  BOOL v18;
  unint64_t count;
  void (*v20)(uint64_t, _QWORD);
  uint64_t v21;
  char v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_keys = &self->keys;
  internalProps = self->keys.internalProps;
  capacity = self->capacity;
  items = self->keys.items;
  v9 = a3;
  do
    v9 = (v9 - 1) & (capacity - 1);
  while (items[v9] != (void *)*((unsigned __int8 *)internalProps + 3));
  while (1)
  {
    v9 = (capacity - 1) & (v9 + 1);
    v23 = 0;
    v10 = (*((uint64_t (**)(void **, char *))internalProps + 3))(&items[v9], &v23);
    p_values = &self->values;
    v12 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v9], 0);
    v13 = v12;
    if (!v10 && v23 != 0)
      break;
    if (v10)
      v15 = v12 == 0;
    else
      v15 = 1;
    if (v15)
    {
      if (v10)
      {
        v16 = (void (*)(unint64_t, _QWORD))*((_QWORD *)p_keys->acquisitionProps + 2);
        if (v16)
          v16(v10, *((_QWORD *)p_keys->personalityProps + 1));
      }
      (*((void (**)(void **))p_keys->internalProps + 6))(&p_keys->items[v9]);
      v17 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->values.acquisitionProps + 2);
      if (v17)
        v18 = v13 == 0;
      else
        v18 = 1;
      if (!v18)
        v17(v13, *((_QWORD *)self->values.personalityProps + 1));
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
      count = self->count;
      if (count)
        self->count = count - 1;
      else
        -[NSConcreteMapTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
    }
    else
    {
      (*((void (**)(void **))p_keys->internalProps + 6))(&p_keys->items[v9]);
      (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
      v21 = probeGC(self, v10, 0, 0, 0);
      (*((void (**)(void **, uint64_t, unint64_t))p_keys->internalProps + 7))(p_keys->items, v21, v10);
      (*((void (**)(void **, uint64_t, uint64_t))self->values.internalProps + 7))(p_values->items, v21, v13);
    }
    (*((void (**)(unint64_t))p_keys->internalProps + 4))(v10);
    (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
LABEL_31:
    capacity = self->capacity;
    internalProps = p_keys->internalProps;
    items = p_keys->items;
  }
  if (v12)
  {
    NSLog((NSString *)CFSTR("NSMaptable %p isEmpty key but not value %p at index %ld"), self, v12, v9);
    v20 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->values.acquisitionProps + 2);
    if (v20)
      v20(v13, *((_QWORD *)self->values.personalityProps + 1));
    (*((void (**)(void **))self->values.internalProps + 6))(&p_values->items[v9]);
  }
  (*((void (**)(_QWORD))p_keys->internalProps + 4))(0);
  (*((void (**)(uint64_t))self->values.internalProps + 4))(v13);
  if (v9 == a3)
    goto LABEL_31;
  return v9;
}

- (void)setItem:(const void *)a3 forKnownAbsentKey:(const void *)a4
{
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v9 = 0;
    v7 = probeGC(self, (unint64_t)a4, &v9, 0, 1);
    if (v9)
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("value not absent"), CFSTR("value not absent"), 0));
    -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1);
    v8 = self->count + 1;
    self->count = v8;
    if (self->capacity < 2 * v8)
      -[NSConcreteMapTable grow](self, "grow");
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  NSSliceExternalPersonalityProperties *personalityProps;
  uint64_t v7;
  NSSliceExternalPersonalityProperties *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t capacity;
  unint64_t v12;

  if (a3 == self)
  {
    LOBYTE(v10) = 1;
  }
  else if (a3
         && (v5 = objc_opt_class(), v5 == objc_opt_class())
         && !*((_BYTE *)self->keys.internalProps + 1)
         && !*((_BYTE *)self->values.internalProps + 1)
         && self->count == *((_QWORD *)a3 + 9)
         && (personalityProps = self->keys.personalityProps,
             v7 = *((_QWORD *)a3 + 3),
             *((_QWORD *)personalityProps + 3) == *(_QWORD *)(v7 + 24))
         && (v8 = self->values.personalityProps, v9 = *((_QWORD *)a3 + 7), *((_QWORD *)v8 + 3) == *(_QWORD *)(v9 + 24))
         && *((_QWORD *)personalityProps + 1) == *(_QWORD *)(v7 + 8)
         && *((_QWORD *)v8 + 1) == *(_QWORD *)(v9 + 8))
  {
    capacity = self->capacity;
    if (capacity)
    {
      v12 = 0;
      while (1)
      {
        if (self->keys.items[v12])
        {
          v10 = objc_msgSend(a3, "objectForKey:");
          if (!v10)
            return v10;
          LODWORD(v10) = (*((uint64_t (**)(void *, uint64_t, _QWORD))self->values.personalityProps + 3))(self->values.items[v12], v10, *((_QWORD *)self->values.personalityProps + 1));
          if (!(_DWORD)v10)
            return v10;
          capacity = self->capacity;
        }
        ++v12;
        LOBYTE(v10) = 1;
        if (v12 >= capacity)
          return v10;
      }
    }
    LOBYTE(v10) = 1;
  }
  else
  {
    LOBYTE(v10) = 0;
  }
  return v10;
}

- (NSConcreteMapTable)init
{
  return -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:](self, "initWithKeyOptions:valueOptions:capacity:", 0, 0, 16);
}

- (BOOL)mapMember:(const void *)a3 originalKey:(const void *)a4 value:(const void *)a5
{
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  NSSlice *p_keys;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v13 = 0;
  v8 = probeGC(self, (unint64_t)a3, &v13, 0, 0);
  v9 = v13 != 0;
  if (v13)
  {
    v10 = v8;
    if (a5)
    {
      *a5 = (const void *)(*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v8], 0);
      (*((void (**)(void))self->values.internalProps + 5))();
    }
    if (a4)
    {
      p_keys = &self->keys;
      *a4 = (const void *)(*((uint64_t (**)(void **, _QWORD))p_keys->internalProps + 3))(&p_keys->items[v10], 0);
      (*((void (**)(void))p_keys->internalProps + 5))();
    }
  }
  return v9;
}

- (void)raiseCountUnderflowException
{
  NSString *v2;

  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSMapTable %@] count underflow"), self);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v2, 0));
}

- (void)checkCount:(const char *)a3
{
  unint64_t v4;
  unint64_t count;
  NSString *v6;

  v4 = -[NSConcreteMapTable realCount](self, "realCount", a3);
  count = self->count;
  if (v4 > count && !self->shouldRehash)
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSMapTable %@] real count %ld exceeds count %ld when it shouldn't"), self, v4, count);
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcreteMapTable)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  NSConcreteMapTable *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.count")))
  {
    v5 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.count"));
    if (v5 < 0)
    {

      objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("NSMapTable archive contains negative count")));
      return 0;
    }
    v6 = v5;
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  v21[0] = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", (char *)v21 + 4, 4);
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", v21, 4);
  v8 = SHIDWORD(v21[0]);
  if ((_NSPointerFunctionCoding_isValidOptions(SWORD2(v21[0])) & 1) == 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded unsupported NSMapTable key options %x"), HIDWORD(v21[0])));
    return 0;
  }
  v9 = SLODWORD(v21[0]);
  if ((_NSPointerFunctionCoding_isValidOptions(v21[0]) & 1) == 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded unsupported NSMapTable value options %x"), LODWORD(v21[0])));
    return 0;
  }
  v10 = -[NSConcreteMapTable initWithKeyOptions:valueOptions:capacity:](self, "initWithKeyOptions:valueOptions:capacity:", v8, v9, 16);
  if ((v7 & 1) != 0)
  {
    if (!v6)
      return v10;
    v11 = BYTE4(v21[0]) & 5;
    v12 = v21[0] & 5;
    while (1)
    {
      if ((objc_msgSend(a3, "_containsNextUnkeyedObject") & 1) == 0)
      {
        v18 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing expected key for key while decoding NSMapTable"));

        objc_msgSend(a3, "failWithError:", v18);
        return 0;
      }
      v13 = objc_msgSend(a3, "decodeObject");
      if ((objc_msgSend(a3, "_containsNextUnkeyedObject") & 1) == 0)
      {
        v19 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing expected key for value while decoding NSMapTable"));

        objc_msgSend(a3, "failWithError:", v19);
        return 0;
      }
      v14 = objc_msgSend(a3, "decodeObject");
      if (v13)
      {
        if (v14)
        {
          -[NSConcreteMapTable setObject:forKey:](v10, "setObject:forKey:", v14, v13);
        }
        else if (!v12)
        {
LABEL_31:

          objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing key while decoding NSMapTable")));
          return 0;
        }
      }
      else if (!v11)
      {
        goto LABEL_31;
      }
      if (!--v6)
        return v10;
    }
  }
  for (i = objc_msgSend(a3, "decodeObject"); ; i = objc_msgSend(a3, "decodeObject"))
  {
    v16 = i;
    if (!i)
      break;
    v17 = objc_msgSend(a3, "decodeObject");
    if (!v17)
    {

      objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing object for non-nil key %@ while decoding NSMapTable"), v16));
      return 0;
    }
    -[NSConcreteMapTable setObject:forKey:](v10, "setObject:forKey:", v17, v16);
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t *p_keyOptions;
  unint64_t keyOptions;
  unint64_t *p_valueOptions;
  unint64_t valueOptions;
  int v9;
  unint64_t count;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  int v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  unint64_t *v32;
  unint64_t *v33;
  int v34;
  char v35;
  char v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  p_keyOptions = &self->keyOptions;
  keyOptions = self->keyOptions;
  p_valueOptions = &self->valueOptions;
  valueOptions = self->valueOptions;
  v9 = objc_msgSend(a3, "allowsKeyedCoding");
  if ((_NSPointerFunctionCoding_isValidOptions(*p_keyOptions) & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("NSMapTable has invalid key options for encoding");
    goto LABEL_42;
  }
  if ((_NSPointerFunctionCoding_isValidOptions(*p_valueOptions) & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("NSMapTable has invalid value options for encoding");
    goto LABEL_42;
  }
  count = self->count;
  if ((count & 0x8000000000000000) != 0 || (v11 = _NSPointerFunctionCoding_bufferForCount(2 * count)) == 0)
  {
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("NSMapTable is too big to archive");
    goto LABEL_42;
  }
  v12 = v11;
  v35 = valueOptions;
  v36 = keyOptions;
  v32 = p_keyOptions;
  v33 = p_valueOptions;
  v34 = v9;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = -[NSConcreteMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  if (!v13)
  {
    v15 = 0;
    goto LABEL_18;
  }
  v14 = v13;
  v15 = 0;
  v16 = *(_QWORD *)v39;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v39 != v16)
        objc_enumerationMutation(self);
      v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
      v19 = -[NSConcreteMapTable objectForKey:](self, "objectForKey:", v18);
      if (v18)
        v20 = v19 == 0;
      else
        v20 = 1;
      if (v20)
      {
        free(v12);
        v29 = (void *)MEMORY[0x1E0C99DA0];
        v30 = *MEMORY[0x1E0C99778];
        v31 = CFSTR("NSMapTable has nil item that cannot be encoded");
        goto LABEL_42;
      }
      *((_QWORD *)v12 + v15) = v18;
      *((_QWORD *)v12 + count + v15++) = v19;
    }
    v14 = -[NSConcreteMapTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
  }
  while (v14);
LABEL_18:
  v21 = v36 & 7;
  v22 = v35 & 7;
  v23 = v15 >= count;
  if (v21 == 5)
    v23 = 1;
  if (v22 == 5)
    v23 = 1;
  if (v15 > count || !v23)
  {
    free(v12);
    v29 = (void *)MEMORY[0x1E0C99DA0];
    v30 = *MEMORY[0x1E0C99778];
    v31 = CFSTR("NSMapTable was modified during archival");
LABEL_42:
    objc_exception_throw((id)objc_msgSend(v29, "exceptionWithName:reason:userInfo:", v30, v31, 0));
  }
  if (v21 != 5)
    v9 = 0;
  if (v22 == 5)
    v24 = v34;
  else
    v24 = 0;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", v32);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", v33);
  if (v15)
  {
    v25 = (uint64_t *)v12;
    v26 = v15;
    do
    {
      v27 = *v25;
      if (v9)
        objc_msgSend(a3, "encodeConditionalObject:", v27);
      else
        objc_msgSend(a3, "encodeObject:", v27);
      v28 = v25[count];
      if (v24)
        objc_msgSend(a3, "encodeConditionalObject:", v28);
      else
        objc_msgSend(a3, "encodeObject:", v28);
      ++v25;
      --v26;
    }
    while (v26);
  }
  objc_msgSend(a3, "encodeObject:", 0);
  free(v12);
  if ((v34 & 1) != 0)
    objc_msgSend(a3, "encodeInt64:forKey:", v15, CFSTR("NS.count"));
}

- (id)keyPointerFunctions
{
  NSConcretePointerFunctions *v3;

  v3 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v3->slice.items, &self->keys.items);
  return v3;
}

- (id)valuePointerFunctions
{
  NSConcretePointerFunctions *v3;

  v3 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v3->slice.items, &self->values.items);
  return v3;
}

- (unint64_t)__capacity
{
  return self->capacity;
}

- (BOOL)containsKeys:(const void *)a3 values:(const void *)a4 count:(unint64_t)a5
{
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v9 = 0;
    v10 = 0;
    while (-[NSConcreteMapTable objectForKey:](self, "objectForKey:", a3[v10]))
    {
      v14 = 0;
      v11 = probeGC(self, (unint64_t)a3[v10], &v14, 0, 0);
      v12 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v11], 0);
      if (!v14
        || ((*((uint64_t (**)(const void *, uint64_t, _QWORD))self->values.personalityProps + 3))(a4[v10], v12, *((_QWORD *)self->values.personalityProps + 1)) & 1) == 0)
      {
        (*((void (**)(uint64_t))self->values.internalProps + 4))(v12);
        return v9;
      }
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v12);
      v9 = ++v10 >= a5;
      if (a5 == v10)
        return 1;
    }
    NSLog((NSString *)CFSTR("*** not a member: %p\n"), a3[v10]);
  }
  else
  {
    return 1;
  }
  return v9;
}

- (id)dump
{
  NSString *v3;
  unint64_t capacity;
  unint64_t v5;
  NSSlice *p_keys;
  void *v7;
  void *v8;

  v3 = +[NSString string](NSMutableString, "string");
  capacity = self->capacity;
  if (capacity)
  {
    v5 = 0;
    p_keys = &self->keys;
    v7 = (void *)*((unsigned __int8 *)self->keys.internalProps + 3);
    do
    {
      v8 = self->values.items[v5];
      if (p_keys->items[v5] != v7 || v8 != 0)
      {
        -[NSString appendFormat:](v3, "appendFormat:", CFSTR("[%lu] %p -> %p\n"), v5, p_keys->items[v5], v8);
        capacity = self->capacity;
      }
      ++v5;
    }
    while (v5 < capacity);
  }
  return v3;
}

- (void)setItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v9 = 0;
      v7 = probeGC(self, (unint64_t)a4, &v9, 0, 1);
      if (!v9)
      {
        -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1);
        v8 = self->count + 1;
        self->count = v8;
        if (self->capacity < 2 * v8)
          -[NSConcreteMapTable grow](self, "grow");
      }
    }
  }
}

- (void)existingItemForSetItem:(const void *)a3 forAbsentKey:(const void *)a4
{
  uint64_t v7;
  NSSlice *p_values;
  void *v9;
  unint64_t v10;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (!a4)
    return 0;
  v12 = 0;
  v7 = probeGC(self, (unint64_t)a4, &v12, 0, 1);
  if (!v12)
  {
    if (a3)
    {
      -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v7, a4, a3, 1);
      v10 = self->count + 1;
      self->count = v10;
      if (self->capacity < 2 * v10)
        -[NSConcreteMapTable grow](self, "grow");
    }
    return 0;
  }
  p_values = &self->values;
  v9 = (void *)(*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v7], 0);
  (*((void (**)(void))p_values->internalProps + 5))();
  return v9;
}

- (void)replaceItem:(const void *)a3 forExistingKey:(const void *)a4
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v9 = 0;
      v7 = probeGC(self, (unint64_t)a4, &v9, 0, 1);
      if (v9)
      {
        v8 = v7;
        if ((*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v7], 0))
        {
          (*((void (**)(void))self->values.internalProps + 4))();
          -[NSConcreteMapTable assign:key:value:isNew:](self, "assign:key:value:isNew:", v8, a4, a3, 0);
        }
      }
    }
  }
}

- (id)description
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  NSString *v11;

  v11 = +[NSString string](NSMutableString, "string");
  -[NSString appendFormat:](v11, "appendFormat:", CFSTR("NSMapTable {\n"));
  if (self->capacity)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (*((uint64_t (**)(void **, _QWORD))self->keys.internalProps + 3))(&self->keys.items[v3], 0);
      v6 = (*((uint64_t (**)(void **, _QWORD))self->values.internalProps + 3))(&self->values.items[v3], 0);
      v7 = v6;
      if (v5)
        v8 = v6 == 0;
      else
        v8 = 1;
      if (!v8)
      {
        v9 = (*((uint64_t (**)(uint64_t))self->keys.personalityProps + 4))(v5);
        -[NSString appendFormat:](v11, "appendFormat:", CFSTR("[%lu] %@ -> %@\n"), v4, v9, (*((uint64_t (**)(uint64_t))self->values.personalityProps + 4))(v7));
      }
      (*((void (**)(uint64_t))self->keys.internalProps + 4))(v5);
      (*((void (**)(uint64_t))self->values.internalProps + 4))(v7);
      ++v4;
      ++v3;
    }
    while (v4 < self->capacity);
  }
  -[NSString appendString:](v11, "appendString:", CFSTR("}\n"));
  return v11;
}

- (unint64_t)hash
{
  if (!*(_BYTE *)(*(_QWORD *)(self + 32) + 1) && !*(_BYTE *)(*(_QWORD *)(self + 64) + 1))
    return *(_QWORD *)(self + 72);
  return self;
}

@end
