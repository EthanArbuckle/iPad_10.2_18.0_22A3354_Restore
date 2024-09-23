@implementation NSKnownKeysDictionary1

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
          -[NSKnownKeysDictionary1 dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (void)dealloc
{
  unint64_t v3;
  unint64_t v4;
  id *values;
  void *v6;

  v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v3)
  {
    v4 = v3;
    values = self->_values;
    do
    {
      v6 = *values++;

      --v4;
    }
    while (v4);
  }

  self->_keySearch = 0;
  _PFDeallocateObject(self);
}

- (id)objectForKey:(id)a3
{
  uint64_t v4;

  v4 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return self->_values[v4];
}

+ (id)initWithSearchStrategy:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v5 = objc_msgSend(a3, "length");
  if (v5 <= 1)
    v6 = 1;
  else
    v6 = v5;
  v7 = _PFAllocateObject((Class)a1, 8 * v6);
  v7[2] = a3;
  *((_DWORD *)v7 + 3) = -1;
  return v7;
}

- (id)allValues
{
  unint64_t v3;
  void *v4;
  id *values;

  v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSKnownKeysDictionary1 count](self, "count"));
  if (v3)
  {
    values = self->_values;
    do
    {
      if (*values)
        objc_msgSend(v4, "addObject:");
      ++values;
      --v3;
    }
    while (v3);
  }
  return v4;
}

+ (id)initWithObjects:(id *)a3 forKeys:(id *)a4 count:(unint64_t)a5
{
  id v8;
  _QWORD *v9;
  unint64_t v10;
  unsigned int v11;

  v8 = -[NSKnownKeysMappingStrategy initForKeys:count:]([NSKnownKeysMappingStrategy alloc], "initForKeys:count:", a4, a5);
  v9 = (_QWORD *)objc_msgSend(a1, "initWithSearchStrategy:", v8);

  if (a5)
  {
    v10 = 0;
    v11 = 1;
    do
    {
      v9[v10 + 3] = a3[v10];
      v10 = v11++;
    }
    while (v10 < a5);
  }
  return v9;
}

- (void)getObjects:(id *)a3
{
  unint64_t v5;
  uint64_t v6;
  id *values;

  v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v5)
  {
    v6 = 0;
    values = self->_values;
    do
    {
      if (*values)
        a3[v6++] = *values;
      ++values;
      --v5;
    }
    while (v5);
  }
}

- (const)values
{
  return (const void **)self->_values;
}

- (unint64_t)_countByEnumeratingWithState:(unint64_t)a3 objects:(unint64_t)a4 count:(char)a5 forKeys:
{
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  if (result)
  {
    v9 = result;
    if (!*a2)
      a2[2] = result + 16;
    a2[1] = a3;
    v10 = objc_msgSend(*(id *)(result + 16), "length");
    v11 = objc_msgSend(*(id *)(v9 + 16), "keys");
    if ((a5 & 1) != 0)
      v12 = v11;
    else
      v12 = v9 + 24;
    result = 0;
    v13 = *a2;
    if (a4 && v13 < v10)
    {
      result = 0;
      do
      {
        if (*(_QWORD *)(v9 + 24 + 8 * v13))
          *(_QWORD *)(a3 + 8 * result++) = *(_QWORD *)(v12 + 8 * v13);
        ++v13;
      }
      while (v13 < v10 && result < a4);
    }
    *a2 = v13;
  }
  return result;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSKnownKeysDictionary1 _countByEnumeratingWithState:objects:count:forKeys:]((unint64_t)self, &a3->var0, (unint64_t)a4, a5, 1);
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id *values;
  id v10;
  int count;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v7 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a4);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0CB3380];
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The key '%@' is not defined for this NSKnownKeysDictionary"), a4);
    objc_exception_throw((id)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), a4, CFSTR("NSUnknownUserInfoKey"), 0)));
  }
  v8 = v7;
  values = self->_values;
  v10 = self->_values[v7];
  if (v10)
  {
    count = self->_count;
    if (count < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      count = self->_count;
    }
    self->_count = count - 1;

  }
  values[v8] = 0;
  if (a3)
  {
    v12 = self->_count;
    if (v12 < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      v12 = self->_count;
    }
    self->_count = v12 + 1;
    values[v8] = a3;
  }
}

+ (id)initForKeys:(id)a3
{
  id v4;
  void *v5;

  v4 = -[NSKnownKeysMappingStrategy initForKeys:]([NSKnownKeysMappingStrategy alloc], "initForKeys:", a3);
  v5 = (void *)objc_msgSend(a1, "initWithSearchStrategy:", v4);

  return v5;
}

- (unint64_t)_valueCountByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSKnownKeysDictionary1 _countByEnumeratingWithState:objects:count:forKeys:]((unint64_t)self, &a3->var0, (unint64_t)a4, a5, 0);
}

- (id)mapping
{
  return self->_keySearch;
}

- (void)_setValues:(id *)a3 retain:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  unint64_t v8;
  id *values;
  id v10;
  id v11;

  v4 = a4;
  -[NSKnownKeysDictionary1 count](self, "count");
  v7 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v7)
  {
    v8 = v7;
    values = self->_values;
    do
    {
      v10 = *values;
      v11 = *a3;
      if (*values)
      {
        --self->_count;

      }
      if (v11)
      {
        if (v4)
          v11 = v11;
        *values = v11;
        ++self->_count;
      }
      else
      {
        *values = 0;
      }
      ++a3;
      ++values;
      --v8;
    }
    while (v8);
  }
}

- (unint64_t)count
{
  int count;

  count = self->_count;
  if (count < 0)
  {
    -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
    return self->_count;
  }
  return count;
}

- (uint64_t)_recount
{
  uint64_t v1;
  int v2;
  _QWORD *v3;

  if (result)
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 16), "length");
    v2 = 0;
    if (result)
    {
      v3 = (_QWORD *)(v1 + 24);
      do
      {
        if (*v3++)
          ++v2;
        --result;
      }
      while (result);
    }
    *(_DWORD *)(v1 + 12) = v2;
  }
  return result;
}

- (void)setValues:(id *)a3
{
  -[NSKnownKeysDictionary1 _setValues:retain:](self, "_setValues:retain:", a3, 1);
}

- (id)valueAtIndex:(unint64_t)a3
{
  return self->_values[a3];
}

- (NSKnownKeysDictionary1)retain
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

- (id)allKeys
{
  unint64_t v3;
  void *v4;
  id *v5;
  id *v6;
  id *values;

  v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v5 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
  if (v3)
  {
    v6 = v5;
    values = self->_values;
    do
    {
      if (*values)
        objc_msgSend(v4, "addObject:", *v6);
      ++v6;
      ++values;
      --v3;
    }
    while (v3);
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t i;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("searchMapping"));
  v6 = objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("emptyToken"));
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(a3, "allowedClasses"), CFSTR("values"));
  v8 = objc_msgSend(v7, "count");
  v9 = objc_msgSend(v5, "length");
  if (v8 == v9 && v9 < 0x7FFF)
  {
    if ((uint64_t)v8 <= 1)
      v12 = 1;
    else
      v12 = v8;
    if (v8 <= 1)
      v13 = 1;
    else
      v13 = v8;
    v11 = _PFAllocateObject((Class)a1, 8 * v12);
    v14 = v5;
    v11[2] = v14;
    MEMORY[0x1E0C80A78](v14);
    v16 = (char *)v21 - v15;
    if (v8 >= 0x201)
    {
      v16 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(v7, "getObjects:range:", v16, 0, v8);
    }
    else
    {
      bzero((char *)v21 - v15, 8 * v13);
      objc_msgSend(v7, "getObjects:range:", v16, 0, v8);
      if (!v8)
      {
        v17 = 0;
LABEL_24:
        *((_DWORD *)v11 + 3) = v17;
        return v11;
      }
    }
    v17 = 0;
    for (i = 0; i != v8; ++i)
    {
      v19 = *(void **)&v16[8 * i];
      if (v19 != (void *)v6 && (objc_msgSend(*(id *)&v16[8 * i], "isEqual:", v6) & 1) == 0)
      {
        v11[i + 3] = v19;
        ++v17;
      }
    }
    if (v8 >= 0x201)
      NSZoneFree(0, v16);
    goto LABEL_24;
  }
  objc_msgSend(a3, "failWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4864, &unk_1E1F4A890));

  return 0;
}

+ (id)initWithDictionary:(id)a3 copyItems:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  char *v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[2];

  v4 = a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend(a3, "count");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (_QWORD *)objc_msgSend(a1, "initWithSearchStrategy:", objc_msgSend(a3, "mapping"));
    if (v8)
    {
      v9 = objc_msgSend(a3, "values");
      if (v7)
      {
        v10 = v9;
        for (i = 0; i != v7; ++i)
        {
          v12 = *(void **)(v10 + 8 * i);
          if (v12)
          {
            if (v4)
              v13 = (id)objc_msgSend(v12, "copy");
            else
              v13 = v12;
            v8[i + 3] = v13;
          }
        }
      }
    }
  }
  else
  {
    v14 = (_QWORD *)objc_msgSend(a1, "initForKeys:", objc_msgSend(a3, "allKeys"));
    v8 = v14;
    if (v14)
    {
      v15 = (void *)objc_msgSend(v14, "mapping");
      if (v7 <= 1)
        v16 = 1;
      else
        v16 = v7;
      if (v7 >= 0x201)
        v17 = 1;
      else
        v17 = v16;
      v18 = (char *)v26 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0);
      v19 = 8 * v16;
      if (v7 >= 0x201)
      {
        v18 = (char *)NSAllocateScannedUncollectable();
        v20 = (char *)NSAllocateScannedUncollectable();
        objc_msgSend(a3, "getObjects:andKeys:", v18, v20);
      }
      else
      {
        bzero((char *)v26 - ((8 * v17 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v16);
        v20 = (char *)v26 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v20, v19);
        objc_msgSend(a3, "getObjects:andKeys:", v18, v20);
        if (!v7)
          return v8;
      }
      for (j = 0; j != v7; ++j)
      {
        v22 = objc_msgSend(v15, "fastIndexForKnownKey:", *(_QWORD *)&v20[8 * j]);
        v23 = *(void **)&v18[8 * j];
        if (v4)
          v24 = (id)objc_msgSend(v23, "copy");
        else
          v24 = v23;
        v8[v22 + 3] = v24;
      }
      if (v7 >= 0x201)
      {
        NSZoneFree(0, v18);
        NSZoneFree(0, v20);
      }
    }
  }
  return v8;
}

+ (id)initWithDictionary:(id)a3
{
  return (id)objc_msgSend(a1, "initWithDictionary:copyItems:", a3, 0);
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 0;
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

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (void)encodeWithCoder:(id)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "encodeInt32:forKey:", 1, CFSTR("version"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_keySearch, CFSTR("searchMapping"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", "__empty_slot_token_4c24_98dc_ac1e_b773__");
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("emptyToken"));
  v6 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  v7 = v6;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = v6;
  if (v6 >= 0x201)
    v9 = 1;
  else
    v9 = v8;
  v10 = (char *)v14 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v6 >= 0x201)
  {
    v10 = (char *)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v14 - ((8 * v9 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v8);
    if (!v7)
      goto LABEL_15;
  }
  v11 = 0;
  do
  {
    v12 = self->_values[v11];
    if (!v12)
      v12 = v5;
    *(_QWORD *)&v10[8 * v11++] = v12;
  }
  while (v7 != v11);
LABEL_15:
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v10, v7);
  objc_msgSend(a3, "encodeObject:forKey:", v13, CFSTR("values"));

  if (v7 >= 0x201)
    NSZoneFree(0, v10);

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSKnownKeysDictionary1 *v4;
  unint64_t v5;
  unint64_t v6;
  id *values;
  id *v8;
  void *v9;

  v4 = -[NSKnownKeysDictionary initWithSearchStrategy:]([NSKnownKeysDictionary1 alloc], "initWithSearchStrategy:", self->_keySearch);
  v4->_count = self->_count;
  v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v5)
  {
    v6 = v5;
    values = self->_values;
    v8 = v4->_values;
    do
    {
      v9 = *values++;
      *v8++ = v9;
      --v6;
    }
    while (v6);
  }
  return v4;
}

- (const)knownKeyValuesPointer
{
  return (const void **)self->_values;
}

- (void)setValue:(id)a3 atIndex:(unint64_t)a4
{
  id *values;
  id v8;
  int count;
  int v10;

  values = self->_values;
  v8 = self->_values[a4];
  if (v8)
  {
    count = self->_count;
    if (count < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      count = self->_count;
    }
    self->_count = count - 1;

  }
  values[a4] = 0;
  if (a3)
  {
    v10 = self->_count;
    if (v10 < 0)
    {
      -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
      v10 = self->_count;
    }
    self->_count = v10 + 1;
    values[a4] = a3;
  }
}

- (id)keyEnumerator
{
  return -[_NSKnownKeysEnumerator initWithArray:forTarget:withReferenceValues:andRange:andCopyItems:]([_NSKnownKeysEnumerator alloc], (uint64_t)-[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys"), self, (uint64_t)self->_values, 0, -[NSKnownKeysMappingStrategy length](self->_keySearch, "length"));
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  int count;

  v4 = _PFRawIndexForKnownKey(&self->_keySearch->super.isa, (__CFString *)a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    v6 = self->_values[v4];
    if (v6)
    {
      count = self->_count;
      if (count < 0)
      {
        -[NSKnownKeysDictionary1 _recount]((uint64_t)self);
        count = self->_count;
      }
      self->_count = count - 1;

      self->_values[v5] = 0;
    }
  }
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  unint64_t v7;
  id *v8;
  uint64_t v9;
  id *values;
  id v11;

  if (a3)
  {
    if (a4)
    {
      v7 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
      v8 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
      if (v7)
      {
        v9 = 0;
        values = self->_values;
        do
        {
          v11 = *values;
          if (*values)
          {
            a4[v9] = *v8;
            a3[v9++] = v11;
          }
          ++v8;
          ++values;
          --v7;
        }
        while (v7);
      }
    }
    else
    {
      -[NSKnownKeysDictionary1 getObjects:](self, "getObjects:", a3);
    }
  }
  else if (a4)
  {
    -[NSKnownKeysDictionary1 getKeys:](self, "getKeys:", a4);
  }
}

- (void)getKeys:(id *)a3
{
  unint64_t v5;
  id *v6;
  uint64_t v7;
  id *values;

  v5 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  v6 = -[NSKnownKeysMappingStrategy keys](self->_keySearch, "keys");
  if (v5)
  {
    v7 = 0;
    values = self->_values;
    do
    {
      if (*values)
        a3[v7++] = *v6;
      ++v6;
      ++values;
      --v5;
    }
    while (v5);
  }
}

- (BOOL)isEqualToDictionary:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;

  if (self == a3)
    return 1;
  v7 = v3;
  v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)NSKnownKeysDictionary1;
  return -[NSKnownKeysDictionary1 isEqualToDictionary:](&v6, sel_isEqualToDictionary_);
}

- (id)objectEnumerator
{
  return -[_NSKnownKeysEnumerator initWithArray:forTarget:withReferenceValues:andRange:andCopyItems:]([_NSKnownKeysEnumerator alloc], (uint64_t)self->_values, self, (uint64_t)self->_values, 0, -[NSKnownKeysMappingStrategy length](self->_keySearch, "length"));
}

- (void)addEntriesFromDictionary:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  size_t v14;
  char *v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend((id)objc_msgSend(a3, "mapping"), "isEqual:", -[NSKnownKeysDictionary1 mapping](self, "mapping")))
  {
    v6 = objc_msgSend(a3, "values");
    if (v5)
    {
      v7 = v6;
      for (i = 0; i != v5; ++i)
      {
        v9 = *(_QWORD *)(v7 + 8 * i);
        if (v9)
          -[NSKnownKeysDictionary1 setValue:atIndex:](self, "setValue:atIndex:", v9, i);
      }
    }
  }
  else
  {
    v10 = -[NSKnownKeysDictionary1 mapping](self, "mapping");
    if (v5 <= 1)
      v11 = 1;
    else
      v11 = v5;
    if (v5 >= 0x201)
      v12 = 1;
    else
      v12 = v11;
    v13 = (char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v14 = 8 * v11;
    if (v5 >= 0x201)
    {
      v13 = (char *)NSAllocateScannedUncollectable();
      v15 = (char *)NSAllocateScannedUncollectable();
      objc_msgSend(a3, "getObjects:andKeys:", v13, v15);
    }
    else
    {
      bzero((char *)v21 - ((8 * v12 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v11);
      v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, v14);
      objc_msgSend(a3, "getObjects:andKeys:", v13, v15);
      if (!v5)
        return;
    }
    for (j = 0; j != v5; ++j)
    {
      v17 = _PFRawIndexForKnownKey(v10, *(__CFString **)&v15[8 * j]);
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = (void *)MEMORY[0x1E0C99DA0];
        v19 = *MEMORY[0x1E0CB3380];
        v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The key '%@' is not defined for this NSKnownKeysDictionary"), *(_QWORD *)&v15[8 * j]);
        objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", self, CFSTR("NSTargetObjectUserInfoKey"), *(_QWORD *)&v15[8 * j], CFSTR("NSUnknownUserInfoKey"), 0)));
      }
      -[NSKnownKeysDictionary1 setValue:atIndex:](self, "setValue:atIndex:", *(_QWORD *)&v13[8 * j], v17);
    }
    if (v5 >= 0x201)
    {
      NSZoneFree(0, v13);
      NSZoneFree(0, v15);
    }
  }
}

- (void)removeAllObjects
{
  unint64_t v3;
  unint64_t v4;
  id *values;

  v3 = -[NSKnownKeysMappingStrategy length](self->_keySearch, "length");
  if (v3)
  {
    v4 = v3;
    values = self->_values;
    do
    {

      *values++ = 0;
      --v4;
    }
    while (v4);
  }
  self->_count = 0;
}

@end
