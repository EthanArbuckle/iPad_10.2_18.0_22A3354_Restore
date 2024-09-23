@implementation NSConcreteHashTable

- (void)hashGrow
{
  NSSlice *p_slice;
  unint64_t capacity;
  void **items;
  uint64_t v6;
  void **v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  p_slice = &self->slice;
  capacity = self->capacity;
  items = self->slice.items;
  self->capacity = 2 * capacity;
  v6 = (*((uint64_t (**)(void))self->slice.internalProps + 1))();
  p_slice->items = (void **)v6;
  if (!v6)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("*** NSHashTable unable to allocate memory -- allocation function failed"), 0));
  if (capacity)
  {
    v7 = items;
    v8 = capacity;
    do
    {
      v9 = (*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(v7, 0);
      if (v9)
      {
        v10 = v9;
        v11 = hashProbe(self, v9, 0, 0, 0);
        (*((void (**)(void **, uint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v11, v10);
        (*((void (**)(void **))p_slice->internalProps + 6))(v7);
        (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
      }
      ++v7;
      --v8;
    }
    while (v8);
  }
  (*((void (**)(void **, unint64_t))p_slice->internalProps + 2))(items, capacity);
}

- (void)removeItem:(const void *)a3
{
  uint64_t v4;
  void (*v5)(void);
  unint64_t count;
  uint64_t v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7[0] = 0;
    v4 = hashProbe(self, (uint64_t)a3, v7, 0, 1);
    if (v7[0])
    {
      v5 = (void (*)(void))*((_QWORD *)self->slice.acquisitionProps + 2);
      if (v5)
        v5();
      (*((void (**)(void **))self->slice.internalProps + 6))(&self->slice.items[v4]);
      count = self->count;
      if (count)
        self->count = count - 1;
      else
        -[NSConcreteHashTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
      ++self->mutations;
      -[NSConcreteHashTable rehashAround:](self, "rehashAround:", v4);
    }
  }
}

- (unint64_t)rehashAround:(unint64_t)a3
{
  NSSlice *p_slice;
  unint64_t capacity;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t count;
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_slice = &self->slice;
  capacity = self->capacity;
  v7 = a3;
  do
    v7 = (v7 - 1) & (capacity - 1);
  while (self->slice.items[v7] != (void *)*((unsigned __int8 *)self->slice.internalProps + 3));
  while (1)
  {
    v8 = capacity - 1;
    do
      v7 = (v7 + 1) & v8;
    while (v7 == a3);
    v14 = 0;
    v9 = (*((uint64_t (**)(void **, char *))p_slice->internalProps + 3))(&p_slice->items[v7], &v14);
    if (v9)
    {
      v10 = v9;
      (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
      v11 = hashProbe(self, v10, 0, 0, 0);
      (*((void (**)(void **, uint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v11, v10);
      (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
      goto LABEL_11;
    }
    if (v14)
      return v7;
    (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
    count = self->count;
    if (count)
      self->count = count - 1;
    else
      -[NSConcreteHashTable raiseCountUnderflowException](self, "raiseCountUnderflowException");
LABEL_11:
    capacity = self->capacity;
  }
}

- (void)dealloc
{
  NSSlice *p_slice;
  NSSliceInternalProperties *internalProps;
  unint64_t capacity;
  void (*v6)(void **, unint64_t);
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  p_slice = &self->slice;
  internalProps = self->slice.internalProps;
  if (internalProps)
  {
    capacity = self->capacity;
    if (*((_QWORD *)internalProps + 3) && *((_QWORD *)internalProps + 6))
    {
      empty((uint64_t)&self->slice, capacity);
      internalProps = p_slice->internalProps;
    }
    v6 = (void (*)(void **, unint64_t))*((_QWORD *)internalProps + 2);
    if (v6)
      v6(p_slice->items, capacity);
    p_slice->items = 0;
  }
  if ((char)self->options[7] < 0)
    NSSliceDealloc((void **)&p_slice->items);
  v7.receiver = self;
  v7.super_class = (Class)NSConcreteHashTable;
  -[NSConcreteHashTable dealloc](&v7, sel_dealloc);
}

- (NSConcreteHashTable)initWithOptions:(unint64_t)a3 capacity:(unint64_t)a4
{
  char v6;
  BOOL v7;
  NSString *v9;

  *(_QWORD *)self->options = *(_QWORD *)self->options & 0x8000000000000000 | a3 & 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
  {
    if ((a4 & (a4 - 1)) != 0)
    {
      v6 = -1;
      do
      {
        ++v6;
        v7 = a4 > 1;
        a4 >>= 1;
      }
      while (v7);
      a4 = 2 << v6;
    }
  }
  else
  {
    a4 = 4;
  }
  self->capacity = a4;
  self->count = 0;
  self->mutations = 0;
  if (!+[NSConcretePointerFunctions initializeSlice:withOptions:](NSConcretePointerFunctions, "initializeSlice:withOptions:", &self->slice, *(_QWORD *)self->options & 0x7FFFFFFFFFFFFFFFLL))
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSHashTable %@] Requested configuration not supported."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0));
  }
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:", &self->slice, 1, *((unsigned __int8 *)self->slice.acquisitionProps + 3), 0);
  allocateInitialCapacity((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (unint64_t)count
{
  return self->count;
}

- (void)getItem:(const void *)a3
{
  uint64_t v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  v4[0] = 0;
  hashProbe(self, (uint64_t)a3, v4, 0, 0);
  return (void *)v4[0];
}

- (id)copy
{
  NSConcreteHashTable *v3;
  NSConcreteHashTable *v4;
  uint64_t *p_slice;
  NSSlice *v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = [NSConcreteHashTable alloc];
  v4 = v3;
  v3->capacity = self->capacity;
  v3->count = 0;
  *(_QWORD *)v3->options = *(_QWORD *)v3->options & 0x8000000000000000 | *(_QWORD *)self->options & 0x7FFFFFFFFFFFFFFFLL;
  v3->mutations = 0;
  p_slice = (uint64_t *)&v3->slice;
  v6 = &self->slice;
  if ((char)self->options[7] < 0)
  {
    NSSliceInitWithSlice(&v3->slice.items, v6);
    v4->options[7] |= 0x80u;
  }
  else
  {
    v7 = *(_OWORD *)&self->slice.personalityProps;
    *(_OWORD *)p_slice = *(_OWORD *)&v6->items;
    *(_OWORD *)&v3->slice.personalityProps = v7;
  }
  allocateInitialCapacity(p_slice, self->capacity);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(self);
        -[NSConcreteHashTable insertItem:](v4, "insertItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v9);
  }
  return v4;
}

- (id)allObjects
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
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
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
      v5 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  return v3;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t *p_mutations;
  unint64_t var0;
  uint64_t v9;

  p_mutations = &self->mutations;
  a3->var2 = &self->mutations;
  if (a3->var0)
  {
    if (a3->var3[1] == *p_mutations)
      (*((void (**)(id, SEL))self->slice.internalProps + 4))(*a3->var1, a2);
    else
      objc_enumerationMutation(self);
  }
  else
  {
    a3->var3[1] = *p_mutations;
  }
  var0 = a3->var0;
  while (var0 < self->capacity)
  {
    v9 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[var0], 0);
    var0 = a3->var0 + 1;
    a3->var0 = var0;
    if (v9)
    {
      a3->var3[0] = v9;
      a3->var1 = (id *)a3->var3;
      return 1;
    }
  }
  return 0;
}

- (void)insertItem:(const void *)a3
{
  unint64_t v4;
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = 0;
    -[NSConcreteHashTable assign:key:](self, "assign:key:", hashProbe(self, (uint64_t)a3, 0, &v5, 1), a3);
    if (!v5)
    {
      v4 = self->count + 1;
      self->count = v4;
      if (self->capacity < 2 * v4)
        -[NSConcreteHashTable hashGrow](self, "hashGrow");
    }
  }
}

- (void)addObject:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v7 = 0;
    v5 = hashProbe(self, (uint64_t)a3, 0, &v7, 1);
    if (!v7)
    {
      -[NSConcreteHashTable assign:key:](self, "assign:key:", v5, a3);
      v6 = self->count + 1;
      self->count = v6;
      if (self->capacity < 2 * v6)
        -[NSConcreteHashTable hashGrow](self, "hashGrow");
    }
  }
}

- (void)assign:(unint64_t)a3 key:(const void *)a4
{
  NSSlice *p_slice;
  NSSliceExternalAcquisitionProperties *acquisitionProps;
  uint64_t (*v7)(const void *, _QWORD, _QWORD);

  ++self->mutations;
  p_slice = &self->slice;
  acquisitionProps = self->slice.acquisitionProps;
  v7 = (uint64_t (*)(const void *, _QWORD, _QWORD))*((_QWORD *)acquisitionProps + 1);
  if (v7)
    a4 = (const void *)v7(a4, *((_QWORD *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
  (*((void (**)(void **, unint64_t, const void *))p_slice->internalProps + 7))(p_slice->items, a3, a4);
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99EA8]), "initWithObject:", self);
}

- (NSConcreteHashTable)init
{
  return -[NSConcreteHashTable initWithOptions:capacity:](self, "initWithOptions:capacity:", 0, 16);
}

- (void)removeAllItems
{
  empty((uint64_t)&self->slice, self->capacity);
  ++self->mutations;
  self->count = 0;
}

- (NSConcreteHashTable)initWithPointerFunctions:(id)a3 capacity:(unint64_t)a4
{
  char v6;
  BOOL v7;
  NSString *v9;

  if (!a3)
  {
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSPointerArray %@] Functions cannot be NULL."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v9, 0));
  }
  NSSliceInitWithSlice(&self->slice.items, (_QWORD *)a3 + 1);
  self->options[7] |= 0x80u;
  if (a4)
  {
    if ((a4 & (a4 - 1)) != 0)
    {
      v6 = -1;
      do
      {
        ++v6;
        v7 = a4 > 1;
        a4 >>= 1;
      }
      while (v7);
      a4 = 2 << v6;
    }
  }
  else
  {
    a4 = 4;
  }
  self->capacity = a4;
  self->count = 0;
  self->mutations = 0;
  *(_QWORD *)self->options |= 0x7FFFFFFFFFFFFFFFuLL;
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:", &self->slice, 1, *((unsigned __int8 *)self->slice.acquisitionProps + 3), self->options[7] >> 7);
  allocateInitialCapacity((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  NSSliceExternalPersonalityProperties *personalityProps;
  uint64_t v6;
  BOOL result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (*((_BYTE *)self->slice.internalProps + 1))
    return 0;
  if (self->count != *((_QWORD *)a3 + 5))
    return 0;
  personalityProps = self->slice.personalityProps;
  v6 = *((_QWORD *)a3 + 3);
  if (*((_QWORD *)personalityProps + 3) != *(_QWORD *)(v6 + 24)
    || *((_QWORD *)personalityProps + 1) != *(_QWORD *)(v6 + 8))
  {
    return 0;
  }
  if (self->capacity)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[v8], 0);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(a3, "getItem:", v10);
        if (!v12)
        {
          (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
          return 0;
        }
        v13 = (*((uint64_t (**)(uint64_t, uint64_t, _QWORD))self->slice.personalityProps + 3))(v11, v12, *((_QWORD *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
        if (!v13)
          return 0;
      }
      ++v9;
      ++v8;
      result = 1;
      if (v9 >= self->capacity)
        return result;
    }
  }
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcreteHashTable)initWithCoder:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSConcreteHashTable *v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  unsigned int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(a3, "containsValueForKey:", CFSTR("NS.count")))
  {
    v5 = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("NS.count"));
    if (v5 < 0)
    {

      objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("NSHashTable archive contains negative count")));
      return 0;
    }
    v6 = v5;
    v7 = 1;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v15 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v15, 4);
  v8 = (int)v15;
  if ((_NSPointerFunctionCoding_isValidOptions(v15) & 1) == 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Decoded unsupported NSHashTable options %x"), v15));
    return 0;
  }
  v9 = -[NSConcreteHashTable initWithOptions:capacity:](self, "initWithOptions:capacity:", v8, 16);
  if ((v7 & 1) == 0)
  {
    for (i = objc_msgSend(a3, "decodeObject"); i; i = objc_msgSend(a3, "decodeObject"))
      -[NSConcreteHashTable addObject:](v9, "addObject:", i);
    return v9;
  }
  if (!v6)
    return v9;
  v10 = v15 & 5;
  while (1)
  {
    if ((objc_msgSend(a3, "_containsNextUnkeyedObject") & 1) == 0)
    {
      v14 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing expected key while decoding NSHashTable"));

      objc_msgSend(a3, "failWithError:", v14);
      return 0;
    }
    v11 = objc_msgSend(a3, "decodeObject");
    if (!v11)
      break;
    -[NSConcreteHashTable addObject:](v9, "addObject:", v11);
LABEL_14:
    if (!--v6)
      return v9;
  }
  if (v10)
    goto LABEL_14;

  objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Unexpected nil object encountered while decoding NSHashTable.")));
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  int v6;
  unint64_t count;
  _QWORD *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL v16;
  int v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  int v24;
  uint64_t v25;
  _BYTE v26[128];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)self->options;
  v6 = objc_msgSend(a3, "allowsKeyedCoding");
  if ((_NSPointerFunctionCoding_isValidOptions(*(_QWORD *)self->options) & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("NSHashTable has invalid options for encoding");
    goto LABEL_32;
  }
  count = self->count;
  v8 = _NSPointerFunctionCoding_bufferForCount(count);
  if (!v8)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99850];
    v23 = CFSTR("NSHashTable is too big to encode");
LABEL_32:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v23, 0));
  }
  v9 = v8;
  v24 = v6;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  if (!v10)
  {
    v12 = 0;
    goto LABEL_14;
  }
  v11 = v10;
  v12 = 0;
  v13 = *(_QWORD *)v28;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v28 != v13)
        objc_enumerationMutation(self);
      if (v12 > count)
        goto LABEL_30;
      v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
      if (!v15)
      {
        v21 = (void *)MEMORY[0x1E0C99DA0];
        v22 = *MEMORY[0x1E0C99778];
        v23 = CFSTR("NSHashTable contained an invalid nil element that was found while encoding");
        goto LABEL_32;
      }
      v9[v12++] = v15;
    }
    v11 = -[NSConcreteHashTable countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v27, v26, 16);
  }
  while (v11);
LABEL_14:
  v16 = v12 >= count;
  if ((v5 & 7) == 5)
    v16 = 1;
  if (v12 > count || !v16)
  {
LABEL_30:
    free(v9);
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = CFSTR("NSHashTable was modified while encoding");
    goto LABEL_32;
  }
  if ((v5 & 7) == 5)
    v17 = v24;
  else
    v17 = 0;
  v25 = *(_QWORD *)self->options & 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v25);
  if (v12)
  {
    v18 = v9;
    v19 = v12;
    do
    {
      v20 = *v18;
      if (v17)
        objc_msgSend(a3, "encodeConditionalObject:", v20);
      else
        objc_msgSend(a3, "encodeObject:", v20);
      ++v18;
      --v19;
    }
    while (v19);
  }
  objc_msgSend(a3, "encodeObject:", 0);
  if ((v24 & 1) != 0)
    objc_msgSend(a3, "encodeInt64:forKey:", v12, CFSTR("NS.count"));
  free(v9);
}

- (id)pointerFunctions
{
  NSConcretePointerFunctions *v3;

  v3 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v3->slice.items, &self->slice.items);
  return v3;
}

- (unint64_t)hash
{
  if (!*(_BYTE *)(*(_QWORD *)(self + 32) + 1))
    return *(_QWORD *)(self + 40);
  return self;
}

- (void)raiseCountUnderflowException
{
  NSString *v2;

  v2 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSHashTable %@] count underflow"), self);
  objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v2, 0));
}

- (void)rehash
{
  unint64_t count;
  unint64_t v4;
  NSSlice *p_slice;
  void *v6;
  unint64_t v7;

  count = self->count;
  if (count)
  {
    v4 = 0;
    p_slice = &self->slice;
    v6 = (void *)*((unsigned __int8 *)self->slice.internalProps + 3);
    do
    {
      if (p_slice->items[v4] == v6)
      {
        ++v4;
      }
      else
      {
        v7 = -[NSConcreteHashTable rehashAround:](self, "rehashAround:", v4);
        if (v7 < v4)
          return;
        count = self->count;
        v4 = v7;
      }
    }
    while (v4 < count);
  }
}

- (void)insertKnownAbsentItem:(const void *)a3
{
  uint64_t v5;
  unint64_t v6;
  NSString *v7;
  uint64_t v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v8[0] = 0;
    v5 = hashProbe(self, (uint64_t)a3, v8, 0, 1);
    if (v8[0])
    {
      v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[NSConcreteHashTable (%p) insertKnownAbsentItem (%p) already has (%p)"), self, a3, v8[0]);
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0));
    }
    -[NSConcreteHashTable assign:key:](self, "assign:key:", v5, a3);
    v6 = self->count + 1;
    self->count = v6;
    if (self->capacity < 2 * v6)
      -[NSConcreteHashTable hashGrow](self, "hashGrow");
  }
}

- (void)getKeys:(const void *)a3 count:(unint64_t *)a4
{
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSSlice *p_slice;
  const void *v11;

  if (!self->capacity)
  {
    v9 = 0;
    if (!a4)
      return;
    goto LABEL_7;
  }
  v7 = 0;
  v8 = 0;
  v9 = 0;
  p_slice = &self->slice;
  do
  {
    v11 = (const void *)(*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(&p_slice->items[v7], 0);
    (*((void (**)(void))p_slice->internalProps + 5))();
    if (v11)
      a3[v9++] = v11;
    ++v8;
    ++v7;
  }
  while (v8 < self->capacity);
  if (a4)
LABEL_7:
    *a4 = v9;
}

- (id)description
{
  NSString *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = +[NSString string](NSMutableString, "string");
  -[NSString appendString:](v3, "appendString:", CFSTR("NSHashTable {\n"));
  if (self->capacity)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[v4], 0);
      if (v6)
      {
        v7 = v6;
        -[NSString appendFormat:](v3, "appendFormat:", CFSTR("[%lu] %@\n"), v5, (*((uint64_t (**)(void))self->slice.personalityProps + 4))());
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
      }
      ++v5;
      ++v4;
    }
    while (v5 < self->capacity);
  }
  -[NSString appendString:](v3, "appendString:", CFSTR("}\n"));
  return v3;
}

@end
