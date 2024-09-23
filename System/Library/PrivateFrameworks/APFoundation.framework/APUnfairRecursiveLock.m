@implementation APUnfairRecursiveLock

- (APUnfairRecursiveLock)init
{
  APUnfairRecursiveLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)APUnfairRecursiveLock;
  result = -[APUnfairRecursiveLock init](&v3, sel_init);
  if (result)
    result->_lock = 0;
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

@end
