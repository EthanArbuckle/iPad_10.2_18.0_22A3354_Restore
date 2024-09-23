@implementation APUnfairLock

- (void)lock
{
  os_unfair_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (APUnfairLock)initWithOptions:(int64_t)a3
{
  char v3;
  APUnfairLock *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)APUnfairLock;
  result = -[APUnfairLock init](&v5, sel_init);
  if (result)
  {
    result->_unfairLock._os_unfair_lock_opaque = 0;
    if ((v3 & 1) != 0)
      result->_unfairLockOptions |= 0x10000u;
  }
  return result;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void)setUnfairLock:(os_unfair_lock_s)a3
{
  self->_unfairLock = a3;
}

- (unsigned)unfairLockOptions
{
  return self->_unfairLockOptions;
}

- (void)setUnfairLockOptions:(unsigned int)a3
{
  self->_unfairLockOptions = a3;
}

@end
