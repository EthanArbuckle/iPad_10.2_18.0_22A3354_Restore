@implementation NUIsAppleInternal

uint64_t __NUIsAppleInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  NUIsAppleInternal_isAppleInternal = result;
  return result;
}

@end
