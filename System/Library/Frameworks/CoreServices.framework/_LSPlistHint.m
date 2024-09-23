@implementation _LSPlistHint

- (void)setCompleteDictionary:(uint64_t)a1
{
  uint64_t v3;
  void *v4;

  if (a1 && a2 && !*(_BYTE *)(a1 + 24))
  {
    v3 = objc_msgSend(a2, "copy");
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v3;

    *(_BYTE *)(a1 + 24) = 1;
  }
}

- (id)completeDictionary
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
      return *(id *)(a1 + 16);
    a1 = 0;
  }
  return (id)a1;
}

- (id)cachedValueForKey:(uint64_t)a1
{
  if (a1)
  {
    if (*(_BYTE *)(a1 + 24))
      return 0;
    objc_msgSend(*(id *)(a1 + 16), "objectForKeyedSubscript:", a2);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (_QWORD)initWithKeys:(char)a3 compacted:
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_super v10;

  if (!a1)
    return 0;
  v10.receiver = a1;
  v10.super_class = (Class)_LSPlistHint;
  v5 = objc_msgSendSuper2(&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(a2, "copy");
    v7 = (void *)v5[1];
    v5[1] = v6;

    v8 = (void *)v5[2];
    v5[2] = 0;

    *((_BYTE *)v5 + 24) = 0;
    *((_BYTE *)v5 + 25) = a3;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedValues, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (uint64_t)setCachedValue:(uint64_t)a3 forKey:
{
  uint64_t v4;
  void *v6;
  id v7;
  void *v8;

  if (result)
  {
    if (a3)
    {
      v4 = result;
      if (!*(_BYTE *)(result + 24))
      {
        v6 = *(void **)(result + 16);
        if (!v6)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v8 = *(void **)(v4 + 16);
          *(_QWORD *)(v4 + 16) = v7;

          v6 = *(void **)(v4 + 16);
        }
        return objc_msgSend(v6, "setObject:forKeyedSubscript:", a2, a3);
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  NSDictionary *cachedValues;
  uint64_t v8;
  void *v9;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (v4)
  {
    v5 = -[NSSet copy](self->_keys, "copy");
    v6 = (void *)v4[1];
    v4[1] = v5;

    cachedValues = self->_cachedValues;
    if (self->_cachedValuesAreComplete)
      v8 = -[NSDictionary copy](cachedValues, "copy");
    else
      v8 = -[NSDictionary mutableCopy](cachedValues, "mutableCopy");
    v9 = (void *)v4[2];
    v4[2] = v8;

    *((_BYTE *)v4 + 24) = self->_cachedValuesAreComplete;
    *((_BYTE *)v4 + 25) = self->_keysAreCompacted;
  }
  return v4;
}

- (id)debugDescription
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@ %@ %i %i"), objc_opt_class(), self, self->_keys, self->_cachedValues, self->_cachedValuesAreComplete, self->_keysAreCompacted);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
