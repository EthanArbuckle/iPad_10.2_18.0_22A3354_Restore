@implementation AXMHasInternalSecurityPrivilages

uint64_t __AXMHasInternalSecurityPrivilages_block_invoke()
{
  uint64_t result;

  objc_msgSend(AXMBundleID, "UTF8String");
  result = os_variant_allows_internal_security_policies();
  AXMHasInternalSecurityPrivilages__IsInternal = result;
  return result;
}

@end
