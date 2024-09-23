@implementation LSProcessCanAccessProgressPort

void ___LSProcessCanAccessProgressPort_block_invoke()
{
  uint64_t v0;
  id v1;

  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "serviceNameForConnectionType:", 5);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = _LSGetAuditTokenForSelf();
  _LSProcessCanAccessProgressPort_canAccessProgressPort = _LSCheckMachPortAccessForAuditToken(v0, v1) != 0;

}

@end
