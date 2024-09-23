@implementation CNUnfairLock

- (void)unlock
{
  os_unfair_lock_unlock(&self->_os_unfair_lock);
}

- (void)lock
{
  os_unfair_lock_lock(&self->_os_unfair_lock);
}

- (CNUnfairLock)init
{
  CNUnfairLock *v2;
  CNUnfairLock *v3;
  CNUnfairLock *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNUnfairLock;
  v2 = -[CNUnfairLock init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_os_unfair_lock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:pointerValue:", CFSTR("os_unfair_lock_t"), &self->_os_unfair_lock);
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)tryLock
{
  return os_unfair_lock_trylock(&self->_os_unfair_lock);
}

- (void)assertCurrentThreadIsOwner
{
  os_unfair_lock_assert_owner(&self->_os_unfair_lock);
}

- (void)assertCurrentThreadIsNotOwner
{
  os_unfair_lock_assert_not_owner(&self->_os_unfair_lock);
}

@end
