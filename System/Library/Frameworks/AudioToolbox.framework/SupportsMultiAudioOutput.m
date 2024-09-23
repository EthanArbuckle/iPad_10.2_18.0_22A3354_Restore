@implementation SupportsMultiAudioOutput

uint64_t __SupportsMultiAudioOutput_block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  gHapticAudioMultiOutputEnabled = result;
  return result;
}

@end
