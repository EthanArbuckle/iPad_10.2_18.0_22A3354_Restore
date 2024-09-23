@implementation ACIsInternal

uint64_t __ACIsInternal_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  ACIsInternal_isInternal = result;
  return result;
}

@end
