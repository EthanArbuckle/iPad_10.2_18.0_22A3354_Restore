@implementation IsAppleInternalBuild

uint64_t __IsAppleInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  if ((_DWORD)result)
    result = os_variant_has_internal_content();
  IsAppleInternalBuild_sIsInternal = result;
  return result;
}

@end
