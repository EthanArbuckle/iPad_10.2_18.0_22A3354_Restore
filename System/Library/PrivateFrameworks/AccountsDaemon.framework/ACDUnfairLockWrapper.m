@implementation ACDUnfairLockWrapper

- (ACDUnfairLockWrapper)init
{
  ACDUnfairLockWrapper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ACDUnfairLockWrapper;
  result = -[ACDUnfairLockWrapper init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

@end
