@implementation INPlayMediaIntent(AudioSessionPreparation)

- (BOOL)ins_shouldPrepareAudioSession
{
  return (objc_msgSend(a1, "playbackQueueLocation") & 0xFFFFFFFFFFFFFFFELL) != 2;
}

@end
