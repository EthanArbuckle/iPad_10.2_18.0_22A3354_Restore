@implementation LSCheckLSDServiceAccessForAuditToken

Class ___LSCheckLSDServiceAccessForAuditToken_block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("_LSDService"));
  _LSCheckLSDServiceAccessForAuditToken::lsdServiceClass = (uint64_t)result;
  return result;
}

@end
