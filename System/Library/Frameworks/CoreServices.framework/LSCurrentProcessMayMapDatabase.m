@implementation LSCurrentProcessMayMapDatabase

uint64_t ___LSCurrentProcessMayMapDatabase_block_invoke()
{
  uint64_t result;

  if ((objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer") & 1) != 0)
  {
    result = 1;
  }
  else
  {
    if (_LSGetAuditTokenForSelf::once != -1)
      dispatch_once(&_LSGetAuditTokenForSelf::once, &__block_literal_global_115);
    result = _LSAuditTokenMayMapDatabase(_LSGetAuditTokenForSelf::result);
  }
  atomic_store(result, mayMapDatabase);
  return result;
}

@end
