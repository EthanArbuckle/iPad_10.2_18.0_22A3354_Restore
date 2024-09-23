@implementation NoPlayingAudioInfoProvider

- (id)currentlyPlaying
{
  return *(id *)self->currentlyPlaying;
}

@end
