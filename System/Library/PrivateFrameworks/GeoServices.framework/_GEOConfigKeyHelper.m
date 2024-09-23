@implementation _GEOConfigKeyHelper

- (unint64_t)hash
{
  return self->configKey.identifier ^ ((uint64_t)self->configKey.metadata << 8);
}

- (uint64_t)valueChanged
{
  uint64_t v2;
  void *v3;
  BOOL v4;
  uint64_t v5;

  if (!a1)
    return 0;
  -[_GEOConfigKeyHelper _currentValue](a1[5], a1[6]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[1];
  if (v3)
    v4 = 1;
  else
    v4 = v2 == 0;
  if (v4)
  {
    if (!v3 || v2)
    {
      v5 = 0;
      if (v3 && v2)
      {
        v5 = objc_msgSend(v3, "isEqual:", v2) ^ 1;
        v3 = (void *)a1[1];
      }
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0;
  }
  v5 = 1;
LABEL_13:
  a1[1] = v2;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  char isKindOfClass;
  BOOL v6;
  int v7;
  void *v8;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = 0;
  if (self && (isKindOfClass & 1) != 0)
  {
    if (v4)
    {
      v7 = v4[10];
      v8 = (void *)*((_QWORD *)v4 + 6);
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    v6 = v7 == *(_QWORD *)&self->configKey.identifier && v8 == self->configKey.metadata;
  }

  return v6;
}

- (_QWORD)keyString
{
  _QWORD *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[4];
    if (!v2)
    {
      -[_GEOConfigKeyHelper _lookupKeyProperties]((uint64_t)a1);
      v2 = (void *)v1[4];
    }
    a1 = v2;
  }
  return a1;
}

- (void)_lookupKeyProperties
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[5];

  v2 = *(_QWORD *)(a1 + 40);
  v1 = *(_QWORD *)(a1 + 48);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43___GEOConfigKeyHelper__lookupKeyProperties__block_invoke;
  v3[3] = &unk_1E1C10528;
  v3[4] = a1;
  GEOConfigGetPropertiesForKey(v2, v1, v3);
}

- (id)_currentValue
{
  _getValue(a1, a2, 1, 0, 0, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_QWORD)keyNumber
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[3];
    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((unsigned int *)a1 + 10) | (a1[6] << 16));
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[3];
      v1[3] = v3;

      v2 = (void *)v1[3];
    }
    a1 = v2;
  }
  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *metadata;
  uint64_t identifier;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  metadata = self->configKey.metadata;
  identifier = self->configKey.identifier;
  -[_GEOConfigKeyHelper keyNumber](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_GEOConfigKeyHelper keyString](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: md: %p id: %d n: %@ s: %@ lv: %@>"), v5, self, metadata, identifier, v8, v9, self->_lastValue);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);
  objc_storeStrong((id *)&self->_keyNumber, 0);
  objc_storeStrong(&self->_lastValue, 0);
}

@end
