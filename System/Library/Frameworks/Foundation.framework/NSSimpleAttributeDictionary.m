@implementation NSSimpleAttributeDictionary

+ (id)emptyAttributeDictionary
{
  if (qword_1ECD093F8 != -1)
    dispatch_once(&qword_1ECD093F8, &__block_literal_global_1);
  return (id)_MergedGlobals_19;
}

_DWORD *__55__NSSimpleAttributeDictionary_emptyAttributeDictionary__block_invoke()
{
  objc_class *v0;
  _DWORD *result;

  v0 = (objc_class *)objc_opt_self();
  result = NSAllocateObject(v0, 0, 0);
  _MergedGlobals_19 = (uint64_t)result;
  result[2] = 0;
  return result;
}

+ (id)newWithDictionary:(id)a3
{
  char isKindOfClass;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  objc_class *v9;
  _DWORD *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  _DWORD *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  if (a3)
  {
    objc_opt_self();
    isKindOfClass = objc_opt_isKindOfClass();
    a3 = v18;
    if ((isKindOfClass & 1) != 0)
      return v18;
  }
  v6 = objc_msgSend(a3, "count");
  if (!v6)
    return (id)objc_msgSend(a1, "emptyAttributeDictionary");
  v7 = v6;
  v8 = (void *)objc_msgSend(v18, "keyEnumerator");
  v9 = (objc_class *)objc_opt_self();
  v10 = NSAllocateObject(v9, 24 * v7 - 24, 0);
  v10[2] = v7;
  v11 = objc_msgSend(v8, "nextObject");
  if (v11)
  {
    v12 = (void *)v11;
    do
    {
      v13 = objc_msgSend(v12, "hash");
      v14 = v13 % v7;
      v15 = (void *)objc_msgSend(v18, "objectForKey:", v12);
      v16 = v10 + 4;
      while (*(_QWORD *)&v16[6 * v14 + 2])
      {
        if (v14 + 1 == v7)
          v14 = 0;
        else
          ++v14;
      }
      v17 = 3 * v14;
      *(_QWORD *)&v16[2 * v17] = v13;
      *(_QWORD *)&v10[2 * v17 + 6] = objc_msgSend(v12, "copyWithZone:", 0);
      *(_QWORD *)&v10[2 * v17 + 8] = v15;
      v12 = (void *)objc_msgSend(v8, "nextObject");
    }
    while (v12);
  }
  return v10;
}

- (id)newWithKey:(id)a3 object:(id)a4
{
  unint64_t v6;
  NSSimpleAttributeDictionary *v7;
  unint64_t v8;
  unsigned int numElements;
  unint64_t v10;
  id var0;
  int v12;
  objc_class *v14;
  _DWORD *v15;
  id v16;
  uint64_t i;
  unint64_t hash;
  id key;
  id v20;
  _NSSimpleAttributeDictionaryElement *v21;
  unint64_t v22;
  _DWORD *v23;
  _DWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t *v27;
  unint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  NSSimpleAttributeDictionary *v31;
  value *v32;
  _QWORD *v33;
  id v34;
  id v35;

  v6 = -[NSSimpleAttributeDictionary slotForKey:](self, "slotForKey:");
  v7 = self;
  v8 = v6;
  numElements = self->numElements;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    v10 = numElements + 1;
  else
    v10 = numElements;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    var0 = self->elements[v6].var0;
    if (var0 == a4)
      return v7;
    v12 = objc_msgSend(var0, "isEqual:", a4);
    v7 = self;
    if (v12)
      return v7;
  }
  v14 = (objc_class *)objc_opt_self();
  v15 = NSAllocateObject(v14, 24 * v10 - 24, 0);
  v15[2] = v10;
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if ((_DWORD)v10)
    {
      v16 = a4;
      for (i = 0; i != v10; ++i)
      {
        if (i == self->numElements)
        {
          hash = objc_msgSend(a3, "hash");
          key = a3;
          v20 = v16;
        }
        else
        {
          v21 = &self->elements[i];
          key = v21->key;
          v20 = v21->var0;
          hash = v21->hash;
        }
        v22 = hash % v10;
        v23 = v15 + 4;
        while (1)
        {
          v24 = &v23[6 * v22];
          v26 = *((_QWORD *)v24 + 1);
          v25 = v24 + 2;
          if (!v26)
            break;
          if (v22 + 1 == v10)
            v22 = 0;
          else
            ++v22;
        }
        v27 = (unint64_t *)&v23[6 * v22];
        *v27 = hash;
        *v25 = objc_msgSend(key, "copyWithZone:", 0);
        v27[2] = (unint64_t)v20;
      }
    }
  }
  else
  {
    v34 = a4;
    v28 = self->numElements;
    if ((_DWORD)v28)
    {
      v29 = 0;
      v30 = v15;
      v31 = self;
      do
      {
        if (v8 != v29)
        {
          v32 = v31->elements[0].key;
          v30[2] = v31->elements[0].hash;
          v30[3] = -[value copyWithZone:](v32, "copyWithZone:", 0, v34);
          v30[4] = v31->elements[0].var0;
          v28 = self->numElements;
        }
        ++v29;
        v31 = (NSSimpleAttributeDictionary *)((char *)v31 + 24);
        v30 += 3;
      }
      while (v29 < v28);
    }
    v33 = &v15[6 * v8 + 4];
    *v33 = objc_msgSend(a3, "hash", v34);
    v33[1] = objc_msgSend(a3, "copyWithZone:", 0);
    v33[2] = v35;
  }
  return v15;
}

- (unint64_t)count
{
  return self->numElements;
}

- (unint64_t)slotForKey:(id)a3
{
  uint64_t numElements;
  unint64_t v6;
  _NSSimpleAttributeDictionaryElement *elements;
  value **i;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  numElements = self->numElements;
  if (!(_DWORD)numElements)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  elements = self->elements;
  for (i = &self->elements[0].key; *i != a3; i += 3)
  {
    if (numElements == ++v6)
    {
      v9 = objc_msgSend(a3, "hash");
      v10 = self->numElements;
      v11 = v9 % v10;
      v6 = v9 % v10;
      do
      {
        if (elements[v6].hash == v9)
        {
          if ((-[value isEqual:](elements[v6].key, "isEqual:", a3) & 1) != 0)
            return v6;
          v10 = self->numElements;
        }
        if (v6 + 1 == v10)
          v6 = 0;
        else
          ++v6;
      }
      while (v6 != v11);
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (id)objectForKey:(id)a3
{
  unint64_t v4;

  v4 = -[NSSimpleAttributeDictionary slotForKey:](self, "slotForKey:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return self->elements[v4].var0;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(objc_allocWithZone((Class)NSSimpleAttributeDictionaryEnumerator), "initWithAttributeDictionary:", self);
}

- (void)dealloc
{
  unint64_t v3;
  id *p_var0;
  id v5;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (self->numElements)
  {
    v3 = 0;
    p_var0 = &self->elements[0].var0;
    do
    {

      v5 = *p_var0;
      p_var0 += 3;

      ++v3;
    }
    while (v3 < self->numElements);
  }
  v6.receiver = self;
  v6.super_class = (Class)NSSimpleAttributeDictionary;
  -[NSSimpleAttributeDictionary dealloc](&v6, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t numElements;
  id *p_var0;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  objc_super v9;
  _BYTE v10[320];
  _BYTE v11[320];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  numElements = self->numElements;
  if (numElements < 0x29)
  {
    if ((_DWORD)numElements)
    {
      p_var0 = &self->elements[0].var0;
      v6 = v10;
      v7 = v11;
      do
      {
        *v7++ = *(p_var0 - 1);
        v8 = *p_var0;
        p_var0 += 3;
        *v6++ = v8;
        --numElements;
      }
      while (numElements);
    }
    return (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "allocWithZone:", a3), "initWithObjects:forKeys:count:", v10, v11, self->numElements);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)NSSimpleAttributeDictionary;
    return -[NSSimpleAttributeDictionary mutableCopyWithZone:](&v9, sel_mutableCopyWithZone_, a3);
  }
}

@end
