@implementation SecItemDeleteAll

uint64_t __SecItemDeleteAll_block_invoke(uint64_t a1, CFTypeRef *a2)
{
  if (!gSecurityd)
    return securityd_send_sync_and_do(7u, a2, 0, 0);
  if (((*(uint64_t (**)(CFTypeRef *))(gSecurityd + 32))(a2) & 1) != 0)
    return 1;
  return SecError(-26276, (__CFString **)a2, CFSTR("sec_item_delete_all is NULL"));
}

@end
