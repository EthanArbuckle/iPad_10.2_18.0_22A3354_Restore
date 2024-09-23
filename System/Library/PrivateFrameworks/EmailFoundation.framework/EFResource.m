@implementation EFResource

- (void)unlock
{
  os_unfair_lock_unlock(&self->_unfair_lock);
}

- (BOOL)returnResource
{
  int64_t *p_lockCount;
  uint64_t v5;
  void *v7;

  p_lockCount = &self->_lockCount;
  do
    v5 = __ldaxr((unint64_t *)p_lockCount);
  while (__stlxr(v5 - 1, (unint64_t *)p_lockCount));
  if (v5 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFResource.m"), 130, CFSTR("returnResource called too many times"));

  }
  return v5 == 1;
}

- (void)lock
{
  os_unfair_lock_lock(&self->_unfair_lock);
}

- (void)holdResource
{
  int64_t *p_lockCount;
  unint64_t v3;

  p_lockCount = &self->_lockCount;
  do
    v3 = __ldaxr((unint64_t *)p_lockCount);
  while (__stlxr(v3 + 1, (unint64_t *)p_lockCount));
}

- (EFResource)init
{
  EFResource *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EFResource;
  result = -[EFResource init](&v3, sel_init);
  if (result)
  {
    result->_unfair_lock._os_unfair_lock_opaque = 0;
    atomic_store(0, (unint64_t *)&result->_lockCount);
  }
  return result;
}

@end
