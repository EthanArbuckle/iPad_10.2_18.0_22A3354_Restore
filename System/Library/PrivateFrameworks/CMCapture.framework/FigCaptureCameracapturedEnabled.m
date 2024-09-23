@implementation FigCaptureCameracapturedEnabled

uint64_t __FigCaptureCameracapturedEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  FigCaptureCameracapturedEnabled_sCameracapturedEnabled = result;
  return result;
}

@end
