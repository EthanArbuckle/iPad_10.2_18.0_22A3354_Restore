@implementation NWPrivilegedHelperStart

void __NWPrivilegedHelperStart_block_invoke(uint64_t a1)
{
  NWPrivilegedHelper *v1;
  void *v2;

  v1 = -[NWPrivilegedHelper initWithQueue:]([NWPrivilegedHelper alloc], "initWithQueue:", *(_QWORD *)(a1 + 32));
  v2 = (void *)NWPrivilegedHelperStart_sNWPrivilegedHelper;
  NWPrivilegedHelperStart_sNWPrivilegedHelper = (uint64_t)v1;

}

@end
