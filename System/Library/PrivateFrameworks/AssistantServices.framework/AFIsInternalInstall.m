@implementation AFIsInternalInstall

uint64_t __AFIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  AFIsInternalInstall_isInternal = result;
  return result;
}

@end
