@implementation _EFLazyCacheConditionLock

- (_EFLazyCacheConditionLock)initWithCondition:(int64_t)a3
{
  _EFLazyCacheConditionLock *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_EFLazyCacheConditionLock;
  result = -[NSConditionLock initWithCondition:](&v4, sel_initWithCondition_, a3);
  if (result)
    atomic_store(0, (unint64_t *)&result->_waiterCount);
  return result;
}

- (int64_t)waiterCount
{
  return atomic_load((unint64_t *)&self->_waiterCount);
}

- (void)incrementWaiterCount
{
  int64_t *p_waiterCount;
  unint64_t v3;

  p_waiterCount = &self->_waiterCount;
  do
    v3 = __ldaxr((unint64_t *)p_waiterCount);
  while (__stlxr(v3 + 1, (unint64_t *)p_waiterCount));
}

- (void)decrementWaiterCount
{
  int64_t *p_waiterCount;
  unint64_t v3;

  p_waiterCount = &self->_waiterCount;
  do
    v3 = __ldaxr((unint64_t *)p_waiterCount);
  while (__stlxr(v3 - 1, (unint64_t *)p_waiterCount));
}

@end
