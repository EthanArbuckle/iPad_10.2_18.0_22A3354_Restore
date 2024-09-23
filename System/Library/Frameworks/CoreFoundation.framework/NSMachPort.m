@implementation NSMachPort

- (unsigned)_machPort
{
  return self->_machPort;
}

- (void)_setMachPort:(unsigned int)a3
{
  self->_machPort = a3;
}

- (void)_setDelegate:(id)a3
{
  self->_delegate = (NSMachPortDelegate *)a3;
}

- (void)_setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (unint64_t)_flags
{
  return self->_flags;
}

- (void)_increaseRetainCountWithLock:(os_unfair_lock_s *)a3
{
  unint64_t retainCount;

  os_unfair_lock_lock(a3);
  retainCount = self->_retainCount;
  if (retainCount != -1)
    self->_retainCount = retainCount + 1;
  os_unfair_lock_unlock(a3);
}

- (void)_decreaseRetainCountAndMaybeDeallocWithLock:(os_unfair_lock_s *)a3 andPerformWhenZero:(id)a4
{
  unint64_t retainCount;

  os_unfair_lock_lock(a3);
  retainCount = self->_retainCount;
  if (!retainCount)
  {
    os_unfair_lock_unlock(a3);
    (*((void (**)(id))a4 + 2))(a4);
    os_unfair_lock_lock(a3);
    retainCount = self->_retainCount;
  }
  if (retainCount + 1 >= 2)
  {
    self->_retainCount = retainCount - 1;
    os_unfair_lock_unlock(a3);
  }
  else
  {
    os_unfair_lock_unlock(a3);
    if (!retainCount)
      -[NSMachPort dealloc](self, "dealloc");
  }
}

- (id)_delegate
{
  return self->_delegate;
}

- (unint64_t)_retainCount
{
  return self->_retainCount;
}

- (uint32_t)machPort
{
  return self->_machPort;
}

@end
