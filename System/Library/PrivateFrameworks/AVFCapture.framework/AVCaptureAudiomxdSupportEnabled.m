@implementation AVCaptureAudiomxdSupportEnabled

uint64_t __AVCaptureAudiomxdSupportEnabled_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  AVCaptureAudiomxdSupportEnabled_sCaptureAudiomxdSupportEnabled = result;
  return result;
}

@end
