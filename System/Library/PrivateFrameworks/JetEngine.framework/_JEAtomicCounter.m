@implementation _JEAtomicCounter

- (int64_t)increment
{
  int64_t *p_value;
  int64_t result;

  p_value = &self->_value;
  do
    result = __ldaxr((unint64_t *)p_value);
  while (__stlxr(result + 1, (unint64_t *)p_value));
  return result;
}

- (int64_t)decrement
{
  int64_t *p_value;
  int64_t result;

  p_value = &self->_value;
  do
    result = __ldaxr((unint64_t *)p_value);
  while (__stlxr(result - 1, (unint64_t *)p_value));
  return result;
}

- (_JEAtomicCounter)initWithInitialValue:(int64_t)a3
{
  _JEAtomicCounter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_JEAtomicCounter;
  result = -[_JEAtomicCounter init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

- (_JEAtomicCounter)init
{
  -[_JEAtomicCounter doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)currentValue
{
  if (result)
    return atomic_load((unint64_t *)(result + 8));
  return result;
}

- (unint64_t)hash
{
  if (self)
    return atomic_load((unint64_t *)(self + 8));
  return self;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v4 = (unint64_t *)a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (self)
      v5 = atomic_load((unint64_t *)&self->_value);
    else
      v5 = 0;
    v6 = atomic_load(v4 + 1);
    v7 = v5 == v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self)
    v7 = atomic_load((unint64_t *)&self->_value);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@:%p; %ld>"), v5, self, v7);

  return v8;
}

@end
