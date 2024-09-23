@implementation CGOSAppleInternalBuild

uint64_t __CGOSAppleInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  if ((_DWORD)result)
    result = os_variant_has_internal_content();
  CGOSAppleInternalBuild_is_internal = result;
  return result;
}

@end
