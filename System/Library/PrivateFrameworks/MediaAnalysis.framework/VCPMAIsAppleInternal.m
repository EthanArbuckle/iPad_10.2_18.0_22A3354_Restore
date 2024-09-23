@implementation VCPMAIsAppleInternal

uint64_t __VCPMAIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  VCPMAIsAppleInternal_isAppleInternal = result;
  return result;
}

@end
