@implementation CMContinuityCaptureLagunaEnabled

uint64_t __CMContinuityCaptureLagunaEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  CMContinuityCaptureLagunaEnabled_sLagunaEnabled = result;
  return result;
}

@end
