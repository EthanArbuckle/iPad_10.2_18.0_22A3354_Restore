@implementation NSConcretePointerArray

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  uint64_t v8;

  if (a3->var0)
  {
    (*((void (**)(unint64_t, SEL))self->slice.internalProps + 4))(a3->var3[0], a2);
    var0 = a3->var0;
  }
  else
  {
    a3->var2 = &self->mutations;
    if (!*((_BYTE *)self->slice.internalProps + 1))
    {
      a3->var1 = self->slice.items;
      a3->var0 = self->count;
      return self->count;
    }
    var0 = 0;
    a3->var1 = (id *)a3->var3;
  }
  if (var0 >= self->count)
    return 0;
  v8 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[var0], 0);
  ++a3->var0;
  a3->var3[0] = v8;
  return 1;
}

- (void)pointerAtIndex:(unint64_t)a3
{
  unint64_t count;
  NSSlice *p_slice;
  void *v8;
  void *v10;

  count = self->count;
  if (count <= a3)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to access pointer at index %lu beyond bounds %lu"), _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0);
      objc_exception_throw(v10);
    }
    count = self->count;
  }
  if (count <= a3)
    return 0;
  p_slice = &self->slice;
  v8 = (void *)(*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(&p_slice->items[a3], 0);
  (*((void (**)(void))p_slice->internalProps + 5))();
  return v8;
}

- (unint64_t)count
{
  return self->count;
}

- (void)removePointerAtIndex:(unint64_t)a3
{
  unint64_t v3;
  NSSlice *p_slice;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD);
  unint64_t count;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;

  v3 = a3;
  if (self->count <= a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to remove pointer at index %lu beyond bounds %lu"), _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0);
    objc_exception_throw(v13);
  }
  p_slice = &self->slice;
  v6 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[a3], 0);
  if (v6)
  {
    v7 = v6;
    v8 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->slice.acquisitionProps + 2);
    if (v8)
      v8(v6, *((_QWORD *)self->slice.personalityProps + 1));
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[v3]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
  }
  count = self->count;
  if (v3 + 1 < count)
  {
    v10 = 8 * v3 + 8;
    do
    {
      v11 = (*((uint64_t (**)(char *, _QWORD))self->slice.internalProps + 3))((char *)p_slice->items + v10, 0);
      (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(p_slice->items, v3, v11);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v11);
      (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v10);
      count = self->count;
      v12 = v3 + 2;
      ++v3;
      v10 += 8;
    }
    while (v12 < count);
  }
  self->count = count - 1;
  ++self->mutations;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSConcretePointerArray *v4;
  unint64_t count;
  uint64_t v6;
  NSSlice *p_slice;
  uint64_t v8;

  v4 = -[NSConcretePointerArray initWithPointerFunctions:](+[NSPointerArray allocWithZone:](NSConcretePointerArray, "allocWithZone:", a3), "initWithPointerFunctions:", -[NSConcretePointerArray pointerFunctions](self, "pointerFunctions"));
  count = self->count;
  if (count)
  {
    v6 = 0;
    p_slice = &self->slice;
    do
    {
      v8 = (*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(&p_slice->items[v6], 0);
      -[NSConcretePointerArray addPointer:](v4, "addPointer:", v8);
      (*((void (**)(uint64_t))p_slice->internalProps + 4))(v8);
      ++v6;
      --count;
    }
    while (count);
  }
  return v4;
}

- (void)addPointer:(void *)a3
{
  unint64_t count;
  NSSliceExternalAcquisitionProperties *acquisitionProps;
  uint64_t (*v7)(void *, _QWORD, _QWORD);

  count = self->count;
  if (count == self->capacity)
    -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", 2 * count);
  if (a3)
  {
    acquisitionProps = self->slice.acquisitionProps;
    v7 = (uint64_t (*)(void *, _QWORD, _QWORD))*((_QWORD *)acquisitionProps + 1);
    if (v7)
      a3 = (void *)v7(a3, *((_QWORD *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(self->slice.items, self->count, a3);
  if (!a3)
    self->needsCompaction = 1;
  ++self->count;
  ++self->mutations;
}

- (void)arrayGrow:(unint64_t)a3
{
  NSSlice *p_slice;
  void **items;
  uint64_t v7;
  unint64_t v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t capacity;

  p_slice = &self->slice;
  items = self->slice.items;
  v7 = (*((uint64_t (**)(unint64_t, SEL))self->slice.internalProps + 1))(a3, a2);
  p_slice->items = (void **)v7;
  if (!v7)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("*** NSPointerArray unable to allocate memory -- allocation function failed"), 0));
  if (self->capacity)
  {
    v8 = 0;
    v9 = items;
    do
    {
      if (*v9)
      {
        v10 = (*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(v9, 0);
        if (v10)
        {
          v11 = v10;
          (*((void (**)(void **, unint64_t, uint64_t))p_slice->internalProps + 7))(p_slice->items, v8, v10);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v11);
        }
      }
      ++v8;
      capacity = self->capacity;
      ++v9;
    }
    while (v8 < capacity);
  }
  else
  {
    capacity = 0;
  }
  (*((void (**)(void **, unint64_t))p_slice->internalProps + 2))(items, capacity);
  self->capacity = a3;
}

- (NSConcretePointerArray)initWithOptions:(unint64_t)a3
{
  NSString *v6;

  self->options = a3;
  self->capacity = 4;
  self->count = 0;
  self->mutations = 0;
  if (!+[NSConcretePointerFunctions initializeSlice:withOptions:](NSConcretePointerFunctions, "initializeSlice:withOptions:", &self->slice, self->options))
  {
    v6 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSPointerArray %@] Requested configuration not supported."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v6, 0));
  }
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:", &self->slice, 0, *((unsigned __int8 *)self->slice.acquisitionProps + 3), 0);
  allocateInitialCapacity_1((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (NSConcretePointerArray)init
{
  return -[NSConcretePointerArray initWithOptions:](self, "initWithOptions:", 0);
}

- (id)pointerFunctions
{
  NSConcretePointerFunctions *v3;

  v3 = [NSConcretePointerFunctions alloc];
  NSSliceInitWithSlice(&v3->slice.items, &self->slice.items);
  return v3;
}

- (NSConcretePointerArray)initWithPointerFunctions:(id)a3
{
  NSString *v5;

  if (!a3)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("*** -[NSPointerArray %@] Functions cannot be NULL."), NSStringFromSelector(a2));

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v5, 0));
  }
  NSSliceInitWithSlice(&self->slice.items, (_QWORD *)a3 + 1);
  self->hasDynamicSlice = 1;
  self->capacity = 16;
  self->count = 0;
  self->mutations = 0;
  +[NSConcretePointerFunctions initializeBackingStore:sentinel:weakAutoreleasing:dynamic:](NSConcretePointerFunctions, "initializeBackingStore:sentinel:weakAutoreleasing:dynamic:", &self->slice, 0, *((unsigned __int8 *)self->slice.acquisitionProps + 3), 1);
  self->options = -1;
  allocateInitialCapacity_1((uint64_t *)&self->slice, self->capacity);
  return self;
}

- (void)dealloc
{
  NSSlice *p_slice;
  NSSliceInternalProperties *internalProps;
  unint64_t capacity;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD);
  void (*v12)(void **, unint64_t);
  objc_super v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_slice = &self->slice;
  internalProps = self->slice.internalProps;
  if (internalProps)
  {
    capacity = self->capacity;
    if (*((_QWORD *)internalProps + 3))
    {
      if (capacity && *((_QWORD *)internalProps + 6) != 0)
      {
        v7 = 0;
        v8 = self->capacity;
        do
        {
          v9 = (*((uint64_t (**)(void **, _QWORD))p_slice->internalProps + 3))(&p_slice->items[v7], 0);
          v10 = v9;
          if (v9)
          {
            v11 = (void (*)(uint64_t, _QWORD))*((_QWORD *)p_slice->acquisitionProps + 2);
            if (v11)
              v11(v9, *((_QWORD *)p_slice->personalityProps + 1));
          }
          (*((void (**)(void **))p_slice->internalProps + 6))(&p_slice->items[v7]);
          (*((void (**)(uint64_t))p_slice->internalProps + 4))(v10);
          ++v7;
          --v8;
        }
        while (v8);
        internalProps = p_slice->internalProps;
      }
    }
    v12 = (void (*)(void **, unint64_t))*((_QWORD *)internalProps + 2);
    if (v12)
      v12(p_slice->items, capacity);
    p_slice->items = 0;
  }
  if (self->hasDynamicSlice)
    NSSliceDealloc((void **)&p_slice->items);
  v13.receiver = self;
  v13.super_class = (Class)NSConcretePointerArray;
  -[NSConcretePointerArray dealloc](&v13, sel_dealloc);
}

- (void)compact
{
  uint64_t v3;
  unint64_t v4;
  NSSlice *p_slice;
  unint64_t count;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (self->needsCompaction && self->count)
  {
    v3 = 0;
    v4 = 0;
    p_slice = &self->slice;
    while ((*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&p_slice->items[v3], 0))
    {
      (*((void (**)(void))self->slice.internalProps + 4))();
      ++v4;
      count = self->count;
      ++v3;
      if (v4 >= count)
        goto LABEL_8;
    }
    count = self->count;
LABEL_8:
    if (v4 != count)
    {
      v7 = v4 + 1;
      if (v4 + 1 < count)
      {
        v8 = 8 * v4 + 8;
        do
        {
          v9 = (*((uint64_t (**)(char *, _QWORD))self->slice.internalProps + 3))((char *)p_slice->items + v8, 0);
          if (v9)
          {
            v10 = v9;
            (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(p_slice->items, v4, v9);
            (*((void (**)(char *))self->slice.internalProps + 6))((char *)p_slice->items + v8);
            (*((void (**)(uint64_t))self->slice.internalProps + 4))(v10);
            ++v4;
          }
          ++v7;
          v8 += 8;
        }
        while (v7 < self->count);
      }
      self->count = v4;
      ++self->mutations;
      self->needsCompaction = 0;
    }
  }
}

- (void)insertPointer:(void *)a3 atIndex:(unint64_t)a4
{
  unint64_t count;
  uint64_t v8;
  uint64_t v9;
  NSSliceExternalAcquisitionProperties *acquisitionProps;
  uint64_t (*v11)(void *, _QWORD, _QWORD);
  void *v12;

  count = self->count;
  if (count < a4)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to insert pointer at index %lu beyond bounds %lu"), _NSMethodExceptionProem((objc_class *)self, a2), a4, self->count), 0);
    objc_exception_throw(v12);
  }
  if (count == self->capacity)
  {
    -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", 2 * count);
    count = self->count;
  }
  if (count > a4)
  {
    v8 = 8 * count - 8;
    do
    {
      v9 = (*((uint64_t (**)(char *, _QWORD))self->slice.internalProps + 3))((char *)self->slice.items + v8, 0);
      (*((void (**)(void **, unint64_t, uint64_t))self->slice.internalProps + 7))(self->slice.items, count, v9);
      (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
      (*((void (**)(char *))self->slice.internalProps + 6))((char *)self->slice.items + v8);
      v8 -= 8;
      --count;
    }
    while (count > a4);
  }
  if (a3)
  {
    acquisitionProps = self->slice.acquisitionProps;
    v11 = (uint64_t (*)(void *, _QWORD, _QWORD))*((_QWORD *)acquisitionProps + 1);
    if (v11)
      a3 = (void *)v11(a3, *((_QWORD *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(self->slice.items, a4, a3);
  if (!a3)
    self->needsCompaction = 1;
  ++self->count;
  ++self->mutations;
}

- (void)replacePointerAtIndex:(unint64_t)a3 withPointer:(void *)a4
{
  NSSlice *p_slice;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD);
  NSSliceExternalAcquisitionProperties *acquisitionProps;
  uint64_t (*v12)(void *, _QWORD, _QWORD);
  void *v13;

  if (self->count <= a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: attempt to replace pointer at index %lu beyond bounds %lu"), _NSMethodExceptionProem((objc_class *)self, a2), a3, self->count), 0);
    objc_exception_throw(v13);
  }
  p_slice = &self->slice;
  v8 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[a3], 0);
  if (v8)
  {
    v9 = v8;
    v10 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->slice.acquisitionProps + 2);
    if (v10)
      v10(v8, *((_QWORD *)self->slice.personalityProps + 1));
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[a3]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
  }
  if (a4)
  {
    acquisitionProps = self->slice.acquisitionProps;
    v12 = (uint64_t (*)(void *, _QWORD, _QWORD))*((_QWORD *)acquisitionProps + 1);
    if (v12)
      a4 = (void *)v12(a4, *((_QWORD *)self->slice.personalityProps + 1), *((unsigned __int8 *)acquisitionProps + 4));
  }
  (*((void (**)(void **, unint64_t, void *))self->slice.internalProps + 7))(p_slice->items, a3, a4);
  if (!a4)
    self->needsCompaction = 1;
  ++self->mutations;
}

- (void)setCount:(unint64_t)a3
{
  unint64_t count;
  NSSlice *p_slice;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD);
  BOOL v11;

  if (self->count != a3)
  {
    ++self->mutations;
    count = self->count;
    if (count >= a3)
    {
      if (count > a3)
      {
        p_slice = &self->slice;
        do
        {
          v7 = count - 1;
          self->count = v7;
          v8 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&p_slice->items[v7], 0);
          v9 = v8;
          v10 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->slice.acquisitionProps + 2);
          if (v10)
            v11 = v8 == 0;
          else
            v11 = 1;
          if (!v11)
            v10(v8, *((_QWORD *)self->slice.personalityProps + 1));
          (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
          (*((void (**)(uint64_t))self->slice.internalProps + 4))(v9);
          count = self->count;
        }
        while (count > a3);
      }
    }
    else
    {
      if (self->capacity < a3)
        -[NSConcretePointerArray arrayGrow:](self, "arrayGrow:", a3);
      self->count = a3;
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSConcretePointerArray)initWithCoder:(id)a3
{
  NSConcretePointerArray *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  int v10;
  unsigned int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v11, 4);
  if ((_NSPointerFunctionCoding_isValidOptions(v11) & 1) == 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Invalid NSPointerArray options for %d"), v11));
    return 0;
  }
  v10 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v10, 4);
  if (v10 < 0)
  {

    objc_msgSend(a3, "failWithError:", +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("NSPointerArray archive contains negative count")));
    return 0;
  }
  v5 = -[NSConcretePointerArray initWithOptions:](self, "initWithOptions:", (int)v11);
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v10 >= 1)
    {
      v6 = 0;
      while ((objc_msgSend(a3, "_containsNextUnkeyedObject") & 1) != 0)
      {
        -[NSConcretePointerArray addPointer:](v5, "addPointer:", objc_msgSend(a3, "decodeObject"));
        if (++v6 >= v10)
          return v5;
      }
      v8 = +[NSError _readCorruptErrorWithFormat:](NSError, "_readCorruptErrorWithFormat:", CFSTR("Missing expected key while decoding NSPointerArray"));

      objc_msgSend(a3, "failWithError:", v8);
      return 0;
    }
  }
  else if (v10 >= 1)
  {
    for (i = 0; i < v10; ++i)
      -[NSConcretePointerArray addPointer:](v5, "addPointer:", objc_msgSend(a3, "decodeObject"));
  }
  return v5;
}

- (unint64_t)hash
{
  if (!*(_BYTE *)(*(_QWORD *)(self + 32) + 1))
    return *(_QWORD *)(self + 40);
  return self;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  NSSliceExternalPersonalityProperties *personalityProps;
  _QWORD *v8;
  uint64_t v9;
  BOOL result;
  uint64_t v11;
  unint64_t v12;
  NSSliceInternalProperties **p_internalProps;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  int v19;

  if (a3 == self)
    return 1;
  if (!a3)
    return 0;
  v5 = objc_opt_class();
  if (v5 != objc_opt_class())
    return 0;
  v6 = *((_QWORD *)a3 + 5);
  if (v6 != self->count)
    return 0;
  personalityProps = self->slice.personalityProps;
  v8 = (char *)a3 + 8;
  v9 = *((_QWORD *)a3 + 3);
  if (*((_QWORD *)personalityProps + 3) != *(_QWORD *)(v9 + 24)
    || *((_QWORD *)personalityProps + 1) != *(_QWORD *)(v9 + 8))
  {
    return 0;
  }
  if (v6)
  {
    v11 = 0;
    v12 = 0;
    p_internalProps = (NSSliceInternalProperties **)((char *)a3 + 32);
    while (1)
    {
      v14 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(&self->slice.items[v11], 0);
      v15 = (*(uint64_t (**)(uint64_t, _QWORD))(v8[3] + 24))(*v8 + v11 * 8, 0);
      if (v14)
        v16 = v15 == 0;
      else
        v16 = 0;
      if (v16)
      {
        p_internalProps = &self->slice.internalProps;
        goto LABEL_26;
      }
      v17 = v15;
      if (v15 && v14 == 0)
        break;
      if (v14 | v15)
      {
        v19 = (*((uint64_t (**)(uint64_t, uint64_t, _QWORD))self->slice.personalityProps + 3))(v14, v15, *((_QWORD *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v14);
        (*((void (**)(uint64_t))*p_internalProps + 4))(v17);
        if (!v19)
          return 0;
      }
      ++v12;
      ++v11;
      result = 1;
      if (v12 >= self->count)
        return result;
    }
    v14 = v15;
LABEL_26:
    (*((void (**)(uint64_t))*p_internalProps + 4))(v14);
    return 0;
  }
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t options;
  unint64_t count;
  _QWORD *v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  unint64_t v14;
  _BOOL4 v15;
  unint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  unint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (encodeWithCoder__onceToken != -1)
    dispatch_once(&encodeWithCoder__onceToken, &__block_literal_global_35);
  options = self->options;
  if ((_NSPointerFunctionCoding_isValidOptions(options) & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = CFSTR("NSHashTable has invalid options for encoding");
    goto LABEL_27;
  }
  count = self->count;
  v7 = _NSPointerFunctionCoding_bufferForCount(count);
  if (!v7)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99850];
    v20 = CFSTR("NSPointerArray is too big to encode");
LABEL_27:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  v8 = v7;
  v21 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = -[NSConcretePointerArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(self);
        if (v11 > count)
          goto LABEL_26;
        v8[v11++] = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        v21 = v11;
      }
      v10 = -[NSConcretePointerArray countByEnumeratingWithState:objects:count:](self, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  v14 = options & 7;
  v15 = v14 != 5;
  if (v11 >= count)
    v15 = 0;
  if (v11 > count || v15)
  {
LABEL_26:
    free(v8);
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = CFSTR("NSPointerArray was modified while encoding");
    goto LABEL_27;
  }
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &self->options);
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v21);
  if (v21)
  {
    for (j = 0; j < v21; ++j)
    {
      v17 = v8[j];
      if (v14 == 5)
        objc_msgSend(a3, "encodeConditionalObject:", v17);
      else
        objc_msgSend(a3, "encodeObject:", v17);
    }
  }
  objc_msgSend(a3, "encodeObject:", 0);
  free(v8);
}

void __42__NSConcretePointerArray_encodeWithCoder___block_invoke()
{
  NSObject *v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = _NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v1 = 0;
  }
}

- (void)_markNeedsCompaction
{
  self->needsCompaction = 1;
}

- (unint64_t)indexOfPointer:(void *)a3
{
  NSSlice *p_slice;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (!a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  if (self->count)
  {
    p_slice = &self->slice;
    do
    {
      v6 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(p_slice->items, 0);
      if (v6)
      {
        v7 = v6;
        v8 = (*((uint64_t (**)(uint64_t, void *, _QWORD))self->slice.personalityProps + 3))(v6, a3, *((_QWORD *)self->slice.personalityProps + 1));
        (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
        if ((v8 & 1) != 0)
          return 0;
      }
      else
      {
        (*((void (**)(void))self->slice.internalProps + 4))();
      }
    }
    while (self->count);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (void)removePointer:(void *)a3
{
  NSSlice *p_slice;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, _QWORD);

  if (a3 && self->count)
  {
    p_slice = &self->slice;
    while (1)
    {
      v6 = (*((uint64_t (**)(void **, _QWORD))self->slice.internalProps + 3))(p_slice->items, 0);
      if (v6)
      {
        v7 = v6;
        if ((*((unsigned int (**)(uint64_t, void *, _QWORD))self->slice.personalityProps + 3))(v6, a3, *((_QWORD *)self->slice.personalityProps + 1)))
        {
          break;
        }
      }
      if (!self->count)
        return;
    }
    v8 = (void (*)(uint64_t, _QWORD))*((_QWORD *)self->slice.acquisitionProps + 2);
    if (v8)
      v8(v7, *((_QWORD *)self->slice.personalityProps + 1));
    (*((void (**)(void **))self->slice.internalProps + 6))(&p_slice->items[self->count]);
    (*((void (**)(uint64_t))self->slice.internalProps + 4))(v7);
  }
}

@end
