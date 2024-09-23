@implementation __HMFOSUnfairRecursiveLock

- (__HMFOSUnfairRecursiveLock)initWithOptions:(unint64_t)a3
{
  char v3;
  __HMFOSUnfairRecursiveLock *result;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)__HMFOSUnfairRecursiveLock;
  result = -[HMFUnfairLock initWithOptions:](&v5, sel_initWithOptions_, a3 | 2);
  if (result)
  {
    result->_internal = 0;
    result->_internalOptions = (v3 & 1) << 16;
  }
  return result;
}

- (void)lock
{
  os_unfair_recursive_lock_lock_with_options();
}

- (void)unlock
{
  os_unfair_recursive_lock_unlock();
}

- (void)assertOwner
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&self->_internal);
}

- (void)assertNotOwner
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)&self->_internal);
}

- (void)performBlock:(id)a3
{
  void (**v3)(_QWORD);

  if (a3)
  {
    v3 = (void (**)(_QWORD))a3;
    os_unfair_recursive_lock_lock_with_options();
    v3[2](v3);

    os_unfair_recursive_lock_unlock();
  }
}

@end
