@implementation INIsInternalInstall

uint64_t __INIsInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  INIsInternalInstall_isInternal = result;
  return result;
}

@end
