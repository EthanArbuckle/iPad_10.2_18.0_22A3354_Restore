@implementation NSKnownKeysMappingStrategy1

- (CFMutableArrayRef)_makeBranchTableForKeys:(const void *)a1 count:(unint64_t)a2
{
  unint64_t v2;
  uint64_t v4;
  unint64_t v5;
  const void **v6;
  size_t v7;
  const void *i;
  const __CFAllocator *v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  const void *v13;
  const void *v14;
  void *Value;
  unint64_t Count;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const void **v20;
  uint64_t v21;
  CFArrayRef Mutable;
  CFDictionaryValueCallBacks valueCallBacks;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  memset(&valueCallBacks, 0, sizeof(valueCallBacks));
  valueCallBacks.release = *(CFDictionaryReleaseCallBack *)(MEMORY[0x1E0C9B3A0] + 16);
  if (!a2)
    return CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0);
  v2 = a2;
  if (a2 >= 0x201)
    v4 = 1;
  else
    v4 = a2;
  v5 = (8 * v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (const void **)((char *)&v21 - v5);
  v7 = 8 * a2;
  if (v2 > 0x200)
    v6 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v21 - v5, v7);
  for (i = 0; i != (const void *)v2; i = (char *)i + 1)
    v6[(_QWORD)i] = i;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v6, v2, 0, 0);
  if (v2 >= 0x201)
    NSZoneFree(0, v6);
  v12 = CFDictionaryCreateMutable(v10, 0, 0, &valueCallBacks);
  do
  {
    v13 = *a1;
    v14 = (const void *)strlen((const char *)*a1);
    Value = (void *)CFDictionaryGetValue(v12, v14);
    if (!Value)
    {
      Value = CFArrayCreateMutable(v10, 0, 0);
      CFDictionarySetValue(v12, v14, Value);
    }
    CFArrayAppendValue((CFMutableArrayRef)Value, v13);
    ++a1;
    --v2;
  }
  while (v2);
  Count = CFDictionaryGetCount(v12);
  v17 = Count;
  if (Count <= 1)
    v18 = 1;
  else
    v18 = Count;
  if (Count >= 0x201)
    v19 = 1;
  else
    v19 = v18;
  v20 = (const void **)((char *)&v21 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (Count > 0x200)
    v20 = (const void **)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v21 - ((8 * v19 + 15) & 0xFFFFFFFFFFFFFFF0), 8 * v18);
  CFDictionaryGetKeysAndValues(v12, 0, v20);
  v24 = xmmword_1E1EDDE18;
  CFMergeSortArray();
  Mutable = CFArrayCreateMutable(v10, 0, 0);
  makeBranchRow(&Mutable, (CFArrayRef *)v20, v17, v11, 0, 0, 0, 0);
  CFRelease(v11);
  if (v17 >= 0x201)
    NSZoneFree(0, v20);
  CFRelease(v12);
  return Mutable;
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
          -[NSKnownKeysMappingStrategy1 dealloc](self, "dealloc");
          return;
        }
      }
      __clrex();
    }
    __break(1u);
  }
}

- (void)_coreCreationForKeys:(unint64_t)a3 count:
{
  uint64_t v6;
  uint64_t v7;
  const void **v8;
  char v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFArray *v14;
  CFIndex Count;
  const void **v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];
  CFRange v26;

  v25[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  if (a3 > 0x8000)
  {
    v23 = (void *)MEMORY[0x1E0C99DA0];
    v24 = *MEMORY[0x1E0C99778];
    v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ supports a maximum of 32,768 elements.  parameter was %lu"), objc_opt_class(), a3);
    v21 = v23;
    v22 = v24;
LABEL_18:
    objc_exception_throw((id)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, v20, 0));
  }
  MEMORY[0x1E0C80A78]();
  v8 = (const void **)((char *)v25 - v7);
  if (a3 >= 0x201)
  {
    v8 = (const void **)NSAllocateScannedUncollectable();
  }
  else
  {
    bzero((char *)v25 - v7, 8 * v6);
    if (!a3)
    {
      v9 = 1;
      goto LABEL_11;
    }
  }
  v10 = 0;
  do
  {
    v11 = *(void **)(a2 + 8 * v10);
    v12 = v11;
    v13 = objc_msgSend(v11, "UTF8String");
    if (!v13)
    {
      v18 = (void *)MEMORY[0x1E0C99DA0];
      v19 = *MEMORY[0x1E0C99778];
      v20 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ cannot be encoded as UTF-8"), v11);
      v21 = v18;
      v22 = v19;
      goto LABEL_18;
    }
    v8[v10++] = (const void *)v13;
  }
  while (a3 != v10);
  v9 = 0;
LABEL_11:
  a1[3] = a3;
  a1[4] = 0;
  v14 = -[NSKnownKeysMappingStrategy1 _makeBranchTableForKeys:count:](v8, a3);
  Count = CFArrayGetCount(v14);
  v16 = (const void **)PF_CALLOC_SCANNED_BYTES(8 * Count + 8);
  a1[2] = v16;
  v26.location = 0;
  v26.length = Count;
  CFArrayGetValues(v14, v26, v16);
  CFRelease(v14);
  *(_QWORD *)(a1[2] + 8 * Count) = 0;
  a1[5] = PF_ALLOCATE_OBJECT_ARRAY(a3);
  if ((v9 & 1) == 0)
  {
    v17 = 0;
    do
    {
      *(_QWORD *)(a1[5] + 8 * v17) = *(_QWORD *)(a2 + 8 * v17);
      ++v17;
    }
    while (a3 != v17);
  }
  if (a3 >= 0x201)
    NSZoneFree(0, v8);
}

- (void)dealloc
{
  void **table;
  void *v4;
  void **v5;
  malloc_zone_t *v6;
  void *v7;
  malloc_zone_t *v8;
  id *keys;
  unint64_t length;
  void *v11;

  if (self)
  {
    table = (void **)self->_table;
    if (table)
    {
      v4 = *table;
      if (*table)
      {
        v5 = table + 1;
        do
        {
          v6 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
          if (!_PF_Private_Malloc_Zone)
          {
            v6 = malloc_default_zone();
            v4 = *(v5 - 1);
          }
          malloc_zone_free(v6, v4);
          v7 = *v5++;
          v4 = v7;
        }
        while (v7);
      }
      v8 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
      if (!_PF_Private_Malloc_Zone)
        v8 = malloc_default_zone();
      malloc_zone_free(v8, self->_table);
    }
    self->_table = 0;
    keys = self->_keys;
    if (keys)
    {
      length = self->_length;
      if (length)
      {
        do
        {
          v11 = *keys++;

          --length;
        }
        while (length);
        keys = self->_keys;
      }
      PF_FREE_OBJECT_ARRAY(keys);
    }
    self->_keys = 0;
    self->_length = 0;
    _PFDeallocateObject(self);
  }
}

- (NSKnownKeysMappingStrategy1)retain
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

- (unint64_t)fastIndexForKnownKey:(id)a3
{
  unint64_t v4;

  return _PFRawFastIndexForKnownKey(self, (__CFString *)a3, &v4);
}

- (unint64_t)length
{
  return self->_length;
}

- (id)initForKeys:(id *)a3 count:(unint64_t)a4
{
  NSKnownKeysMappingStrategy1 *v6;
  NSKnownKeysMappingStrategy1 *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NSKnownKeysMappingStrategy1;
  v6 = -[NSKnownKeysMappingStrategy1 init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v6, (uint64_t)a3, a4);
  return v7;
}

- (unint64_t)indexForKey:(id)a3
{
  return _PFRawIndexForKnownKey(self, (__CFString *)a3);
}

- (id)keys
{
  return self->_keys;
}

- (id)initForKeys:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "count");
  v6 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)v12 - v8;
  if (v6 > 0x200)
    v9 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)v12 - v8, 8 * v7);
  objc_msgSend(a3, "getObjects:range:", v9, 0, v5);
  v10 = -[NSKnownKeysMappingStrategy1 initForKeys:count:](self, "initForKeys:count:", v9, v5);
  if (v5 >= 0x201)
    NSZoneFree(0, v9);
  return v10;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0;
  unint64_t v6;
  unint64_t length;

  var0 = a3->var0;
  if (!a3->var0)
    a3->var2 = &self->_length;
  v6 = 0;
  a3->var1 = a4;
  if (a5)
  {
    length = self->_length;
    if (var0 < length)
    {
      v6 = 0;
      do
        a4[v6] = (id)*((_QWORD *)&self->_keys[var0] + v6);
      while (++v6 + var0 < length && v6 < a5);
      var0 += v6;
    }
  }
  a3->var0 = var0;
  return v6;
}

+ (void)initialize
{
  uint64_t v2;

  v2 = objc_opt_class();
  if (v2 == objc_opt_class())
  {
    objc_opt_self();
    objc_opt_class();
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

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

- (id)allKeys
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", self->_keys, self->_length);
}

- (BOOL)isEqual:(id)a3
{
  unint64_t length;
  uint64_t v6;
  id v7;
  int v8;

  if (self == a3)
  {
    LOBYTE(v8) = 1;
  }
  else if (a3
         && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
         && (length = self->_length, length == *((_QWORD *)a3 + 3)))
  {
    if (length)
    {
      v6 = 0;
      while (1)
      {
        v7 = self->_keys[v6];
        if (v7 != *(id *)(*((_QWORD *)a3 + 5) + 8 * v6))
        {
          v8 = objc_msgSend(v7, "isEqual:");
          if (!v8)
            break;
        }
        if (length == ++v6)
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (unint64_t)hash
{
  unint64_t length;

  length = self->_length;
  if (length)
    return length & 0x7F | (objc_msgSend(*self->_keys, "hash") << 7);
  return length;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

+ (Class)classForKeyedUnarchiver
{
  return (Class)objc_opt_class();
}

- (NSKnownKeysMappingStrategy1)initWithCoder:(id)a3
{
  NSKnownKeysMappingStrategy1 *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t length;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v4 = self;
  v28 = *MEMORY[0x1E0C80C00];
  self->_length = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("length"));
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("keys"));
  v8 = objc_msgSend(v7, "count");
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "isNSString"))
        {
          v15 = (void *)MEMORY[0x1E0CB35C8];
          v16 = *MEMORY[0x1E0CB28A8];
          v17 = &unk_1E1F4A840;
          v18 = 4866;
          goto LABEL_16;
        }
        ++v12;
      }
      while (v10 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v10 = v9;
      if (v9)
        continue;
      break;
    }
  }
  length = v4->_length;
  if (length != v8 || length >= 0x7FFF)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0CB28A8];
    v17 = &unk_1E1F4A868;
    v18 = 4864;
LABEL_16:
    objc_msgSend(a3, "failWithError:", objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, v18, v17));

    return 0;
  }
  else
  {
    MEMORY[0x1E0C80A78](v9);
    v22 = (char *)&v23 - v21;
    if (v8 > 0x200)
      v22 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v23 - v21, 8 * v20);
    objc_msgSend(v7, "getObjects:range:", v22, 0, v8);
    -[NSKnownKeysMappingStrategy1 _coreCreationForKeys:count:](v4, (uint64_t)v22, v8);
    if (v8 >= 0x201)
      NSZoneFree(0, v22);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;

  objc_msgSend(a3, "encodeInt32:forKey:", 1, CFSTR("version"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_length, CFSTR("length"));
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", self->_keys, self->_length);
  objc_msgSend(a3, "encodeObject:forKey:", v5, CFSTR("keys"));

}

- (id)description
{
  void *v3;
  uint64_t *table;
  uint64_t v5;
  uint64_t v7;
  __CFString *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", self->_keys, self->_length);
  table = (uint64_t *)self->_table;
  if (self->_length < 0x401)
  {
    if (table)
    {
      if (*table)
      {
        v7 = 0;
        while (table[++v7])
          ;
        v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("mapping table %p has %d branch rows:"), self->_table, v7);
        v10 = *table;
        if (*table)
        {
          v11 = 0;
          do
          {
            -[__CFString appendFormat:](v9, "appendFormat:", CFSTR("\n\t %@"), descriptionForBranchRow(v10, v11));
            v10 = table[++v11];
          }
          while (v10);
        }
      }
      else
      {
        v9 = CFSTR("mapping table has 0 branch rows");
      }
    }
    else
    {
      v9 = CFSTR("mapping table pointer is NULL");
    }
  }
  else
  {
    if (table)
    {
      v5 = *table;
      if (*table)
      {
        v5 = 0;
        while (table[++v5])
          ;
      }
    }
    else
    {
      v5 = 0;
    }
    v9 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mapping table %p has %d branch rows: (...)"), self->_table, v5);
  }
  v12 = (void *)MEMORY[0x1E0CB3940];
  v13 = (objc_class *)objc_opt_class();
  v14 = (void *)objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (%p) table of length %d with known keys:%@ and %@"), NSStringFromClass(v13), self, self->_length, v3, v9);

  return v14;
}

@end
