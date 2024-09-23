@implementation FigDebugIsInternalBuild

uint64_t __FigDebugIsInternalBuild_block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  FigDebugIsInternalBuild_isInternalBuild = result;
  return result;
}

@end
