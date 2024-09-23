@implementation HDXPCProcessNameFromAuditToken

uint64_t __HDXPCProcessNameFromAuditToken_block_invoke()
{
  uint64_t result;

  getpid();
  result = sandbox_check();
  HDXPCProcessNameFromAuditToken_pidInfoAllowed = (_DWORD)result == 0;
  return result;
}

@end
