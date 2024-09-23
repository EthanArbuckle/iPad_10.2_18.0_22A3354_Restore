@implementation FigCaptureAudiomxdSupportEnabled

uint64_t __FigCaptureAudiomxdSupportEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  FigCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled = result;
  return result;
}

@end
