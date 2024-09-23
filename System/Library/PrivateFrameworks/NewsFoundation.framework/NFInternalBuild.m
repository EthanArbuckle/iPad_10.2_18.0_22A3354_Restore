@implementation NFInternalBuild

uint64_t __NFInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  NFInternalBuild_internalBuild = result;
  return result;
}

@end
