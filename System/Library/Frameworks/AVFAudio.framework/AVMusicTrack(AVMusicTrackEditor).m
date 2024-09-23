@implementation AVMusicTrack(AVMusicTrackEditor)

- (BOOL)usesAutomatedParameters
{
  return MusicTrackImpl::UsesAutomatedParams(*(MusicTrackImpl **)self->_impl);
}

- (void)setUsesAutomatedParameters:()AVMusicTrackEditor
{
  MusicTrackImpl::UseAutomatedParams(*(MusicTrackImpl **)self->_impl, a3);
}

@end
