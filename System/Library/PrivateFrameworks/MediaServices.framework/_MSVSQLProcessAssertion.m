@implementation _MSVSQLProcessAssertion

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p %@>"), objc_opt_class(), self, self->_name);
}

- (void)invalidate
{
  uint32_t v3;
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[4];
  uint32_t v7;

  os_unfair_lock_lock((os_unfair_lock_t)&__assertionLock);
  if (__assertionCount-- <= 1)
  {
    __assertionCount = 0;
    v3 = arc4random();
    __assertionInvalidationNonce = v3;
    v4 = dispatch_time(0, 5000000000);
    dispatch_get_global_queue(9, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37___MSVSQLProcessAssertion_invalidate__block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v7 = v3;
    dispatch_after(v4, v5, block);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__assertionLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
