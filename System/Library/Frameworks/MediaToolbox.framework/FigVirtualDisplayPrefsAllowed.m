@implementation FigVirtualDisplayPrefsAllowed

uint64_t __FigVirtualDisplayPrefsAllowed_block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  FigVirtualDisplayPrefsAllowed_allowed = result;
  return result;
}

@end
