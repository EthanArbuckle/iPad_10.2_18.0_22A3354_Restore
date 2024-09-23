@implementation FigPreferAudioSessionOverCMSession

uint64_t __FigPreferAudioSessionOverCMSession_block_invoke()
{
  return _os_feature_enabled_impl();
}

@end
