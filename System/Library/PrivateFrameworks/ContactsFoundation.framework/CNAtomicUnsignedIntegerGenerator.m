@implementation CNAtomicUnsignedIntegerGenerator

- (unint64_t)nextUnsignedInteger
{
  int64_t *p_n;
  unint64_t result;

  p_n = &self->_n;
  do
    result = __ldxr((unint64_t *)p_n);
  while (__stxr(result + 1, (unint64_t *)p_n));
  return result;
}

- (CNAtomicUnsignedIntegerGenerator)init
{
  CNAtomicUnsignedIntegerGenerator *v2;
  CNAtomicUnsignedIntegerGenerator *v3;
  CNAtomicUnsignedIntegerGenerator *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNAtomicUnsignedIntegerGenerator;
  v2 = -[CNAtomicUnsignedIntegerGenerator init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    atomic_store(0, (unint64_t *)&v2->_n);
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t *p_n;
  unint64_t v6;
  id v7;
  void *v8;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  p_n = &self->_n;
  do
    v6 = __ldxr((unint64_t *)p_n);
  while (__stxr(v6, (unint64_t *)p_n));
  v7 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", CFSTR("n"));
  objc_msgSend(v4, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
