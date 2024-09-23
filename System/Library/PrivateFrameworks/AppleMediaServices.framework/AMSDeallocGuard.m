@implementation AMSDeallocGuard

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (AMSDeallocGuard)initWithDeallocGuardBlock:(id)a3
{
  id v4;
  AMSDeallocGuard *v5;
  uint64_t v6;
  id block;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSDeallocGuard;
  v5 = -[AMSDeallocGuard init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    block = v5->_block;
    v5->_block = (id)v6;

    v5->_invalidated = 0;
    v5->_invalidationLock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (void)dealloc
{
  os_unfair_lock_s *p_invalidationLock;
  _BOOL4 invalidated;
  void (**v5)(void);
  objc_super v6;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_lock_with_options();
  invalidated = self->_invalidated;
  os_unfair_lock_unlock(p_invalidationLock);
  if (!invalidated)
  {
    -[AMSDeallocGuard block](self, "block");
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v5[2]();

  }
  v6.receiver = self;
  v6.super_class = (Class)AMSDeallocGuard;
  -[AMSDeallocGuard dealloc](&v6, sel_dealloc);
}

- (void)invalidate
{
  os_unfair_lock_s *p_invalidationLock;

  p_invalidationLock = &self->_invalidationLock;
  os_unfair_lock_assert_not_owner(&self->_invalidationLock);
  os_unfair_lock_lock_with_options();
  self->_invalidated = 1;
  os_unfair_lock_unlock(p_invalidationLock);
}

- (id)block
{
  return self->_block;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (os_unfair_lock_s)invalidationLock
{
  return self->_invalidationLock;
}

@end
