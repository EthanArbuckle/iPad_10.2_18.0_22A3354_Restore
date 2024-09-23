@implementation LSDefaultsIsAppleInternal

uint64_t ___LSDefaultsIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  _LSDefaultsIsAppleInternal_appleInternal = result;
  return result;
}

@end
