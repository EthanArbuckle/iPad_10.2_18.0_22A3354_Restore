@implementation _JEAtomicFlag

- (_JEAtomicFlag)initWithInitialValue:(BOOL)a3
{
  _JEAtomicFlag *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_JEAtomicFlag;
  result = -[_JEAtomicFlag init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (BOOL)compareWithValue:(BOOL)a3 andExchangeWithValue:(BOOL)a4
{
  BOOL *p_value;
  int v5;
  BOOL result;

  p_value = &self->_value;
  while (1)
  {
    v5 = __ldaxr((unsigned __int8 *)p_value);
    if (v5 != a3)
      break;
    if (!__stlxr(a4, (unsigned __int8 *)p_value))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

- (uint64_t)currentValue
{
  unsigned __int8 v1;

  if (result)
  {
    v1 = atomic_load((unsigned __int8 *)(result + 8));
    return v1 & 1;
  }
  return result;
}

- (uint64_t)setCurrentValue:(uint64_t)result
{
  if (result)
    atomic_store(a2, (unsigned __int8 *)(result + 8));
  return result;
}

- (_JEAtomicFlag)init
{
  -[_JEAtomicFlag doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)hash
{
  unsigned __int8 v2;

  if (self)
  {
    v2 = atomic_load((unsigned __int8 *)(self + 8));
    return v2 & 1;
  }
  return self;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  unsigned __int8 v5;
  char v6;
  unsigned __int8 v7;
  char v8;

  v4 = (unsigned __int8 *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self)
    {
      v5 = atomic_load((unsigned __int8 *)&self->_value);
      v6 = v5 & 1;
    }
    else
    {
      v6 = 0;
    }
    v7 = atomic_load(v4 + 8);
    v8 = v6 ^ ((v7 & 1) == 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  unsigned __int8 v8;
  void *v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("NO");
  if (self)
  {
    v8 = atomic_load((unsigned __int8 *)&self->_value);
    if ((v8 & 1) != 0)
      v7 = CFSTR("YES");
  }
  v9 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %@>"), v5, self, v7);

  return v9;
}

@end
