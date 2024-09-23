@implementation DOCIsInternalBuild

uint64_t __DOCIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  DOCIsInternalBuild__isInternal = result;
  return result;
}

@end
