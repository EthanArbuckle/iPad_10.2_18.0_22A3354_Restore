@implementation CalCancellationTokenSource

- (void)cancel
{
  atomic_store(1u, (unsigned __int8 *)&self->_isCancelled);
}

- (BOOL)isCancelled
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_isCancelled);
  return v2 & 1;
}

@end
