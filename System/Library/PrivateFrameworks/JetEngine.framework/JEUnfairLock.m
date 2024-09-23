@implementation JEUnfairLock

- (void)lock
{
  os_unfair_lock_lock(&self->_unfairLock);
}

- (void)unlock
{
  os_unfair_lock_unlock(&self->_unfairLock);
}

- (JEUnfairLock)init
{
  JEUnfairLock *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JEUnfairLock;
  result = -[JEUnfairLock init](&v3, sel_init);
  if (result)
    result->_unfairLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() != a1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("JEUnfairLock (aka UnfairLock) does not allow subclassing."));
}

@end
