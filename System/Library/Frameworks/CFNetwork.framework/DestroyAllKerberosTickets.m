@implementation DestroyAllKerberosTickets

uint64_t __DestroyAllKerberosTickets_block_invoke(double a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  if (a4)
    return gss_destroy_cred_delayInitStub(a1);
  return result;
}

@end
