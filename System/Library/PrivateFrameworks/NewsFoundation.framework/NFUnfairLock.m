@implementation NFUnfairLock

- (void)assertLocked
{
  os_unfair_lock_assert_owner(&self->_unfairLock);
}

- (NFUnfairLock)init
{
  return -[NFUnfairLock initWithOptions:](self, "initWithOptions:", 0);
}

- (NFUnfairLock)initWithOptions:(int64_t)a3
{
  char v3;
  NFUnfairLock *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NFUnfairLock;
  result = -[NFUnfairLock init](&v5, sel_init);
  if (result)
  {
    result->_unfairLock._os_unfair_lock_opaque = 0;
    if ((v3 & 1) != 0)
      result->_unfairLockOptions |= 0x10000u;
  }
  return result;
}

- (void)performWithLockSync:(id)a3
{
  void (**v4)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[NFUnfairLock lock](self, "lock");
  v4[2](v4);

  -[NFUnfairLock unlock](self, "unlock");
}

- (void)lock
{
  os_unfair_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (void)assertNotLocked
{
  os_unfair_lock_assert_not_owner(&self->_unfairLock);
}

@end
